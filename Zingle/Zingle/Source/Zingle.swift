//
//  Zingle.swift
//  Zingle
//
//  Created by Hemang on 28/12/17.
//  Copyright © 2017 Hemang Shah. All rights reserved.
//

import UIKit

public class ZingleConfig {
    public init() {}
    ///Set delay to hide Zingle. Default: 2.0.
    public var delay: TimeInterval = 2.0
    ///Set duration of Zingle visible animation. Default: 0.3.
    public var duration: TimeInterval = 0.3
    ///Set Zingle message color. Default: white.
    public var messageColor: UIColor = UIColor.white
    ///Set Zingle message font. Default: UIFont.systemFont(ofSize: 15).
    public var messageFont: UIFont = UIFont.systemFont(ofSize: 15)
    ///Set Zingle message icon. Default: Empty UIImage.
    public var messageIcon: UIImage! = UIImage.init()
    ///Set Zingle background color. Default: red.
    public var backgroundColor: UIColor = UIColor.red
}

public class Zingle: UIView {
    
    typealias CompletionBlock = () -> Void

    fileprivate var isZingleShowing: Bool = false
    fileprivate var delay: TimeInterval
    fileprivate var duration: TimeInterval
    fileprivate var completion: CompletionBlock?
    
    fileprivate var messageButton: UIButton = UIButton.init(type: .custom)
    fileprivate var messageColor: UIColor = UIColor.white
    fileprivate var messageFont: UIFont = UIFont.systemFont(ofSize: 15)
    
    fileprivate let heightForZingal: CGFloat = 30.0
    
    fileprivate var yPosForZingal: CGFloat {
        if let navigationController = ((UIApplication.shared.keyWindow?.rootViewController) as? UINavigationController) {
            return ((navigationController.navigationBar.intrinsicContentSize.height)
                + UIApplication.shared.statusBarFrame.height)
        }
        return 0.0
    }
    
    fileprivate var unhideYPositionForZingle: CGFloat {
        get {
            let yPos = self.yPosForZingal
            return yPos
        }
    }
    
    fileprivate var hiddenYPositionForZingle: CGFloat {
        get {
            let yPos = self.yPosForZingal - heightForZingal
            return yPos
        }
    }

    ///Init Zingle with Duration and Delay. Default Duration (0.3) Delay (2.0)
    public init(duration: TimeInterval = 0.3, delay: TimeInterval = 2.0) {
        
        self.completion = nil
        self.delay = delay
        self.duration = duration

        super.init(frame: CGRect.zero)
        
        self.setupZingle()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: UIViewController Extension
public extension UIViewController {
    ///Show Zingle with config.
    public func zingle(message: String!, withConfig config: ZingleConfig!) {
        Zingle(duration: config.duration, delay: config.delay)
            .backgroundColor(color: config.backgroundColor)
            .message(message: message)
            .messageIcon(icon: config.messageIcon)
            .messageColor(color: config.messageColor)
            .messageFont(font: config.messageFont)
            .show()
    }
    
    ///Show Zingle with default config.
    public func zingle(message: String!) {
        let config = ZingleConfig()
        Zingle(duration: config.duration, delay: config.delay)
            .backgroundColor(color: config.backgroundColor)
            .message(message: message)
            .messageIcon(icon: config.messageIcon)
            .messageColor(color: config.messageColor)
            .messageFont(font: config.messageFont)
            .show()
    }
}

// MARK: setup function
extension Zingle {
    fileprivate func setupZingle() {
        self.setupView()
        self.setupMessageButton()
    }

    fileprivate func setupView() {
        self.backgroundColor = UIColor.backgroundColor
        self.frame = CGRect(x: 0, y: self.hiddenYPositionForZingle, width: UIScreen.main.bounds.width, height: heightForZingal)
    }
    
    fileprivate func setupMessageButton() {
        self.messageButton.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.messageButton.setTitleColor(self.messageColor, for: .normal)
        self.messageButton.titleLabel?.font = self.messageFont
        self.messageButton.backgroundColor = UIColor.clear
        self.messageButton.setTitle("", for: .normal)
        self.messageButton.contentVerticalAlignment = .center
        self.messageButton.contentHorizontalAlignment = .center
        self.addSubview(self.messageButton)
        self.messageButton.centerTextAndImage(spacing: 5.0)
    }
}

// MARK: chaning function and show / hide functions
public extension Zingle {
    
    ///Set Zingle message to display.
    public func message(message: String!) -> Self {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self.duration/4.0) {
            self.messageButton.setTitle(message, for: .normal)
        }
        return self
    }
    
    ///Set Zingle message icon.
    public func messageIcon(icon: UIImage!) -> Self {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self.duration/1.5) {
            self.messageButton.setImage(icon, for: .normal)
        }
        return self
    }
    
    ///Set Zingle message color.
    public func messageColor(color: UIColor!) -> Self {
        self.messageButton.setTitleColor(color, for: .normal)
        return self
    }
    
    ///Set Zingle background color.
    public func backgroundColor(color: UIColor!) -> Self {
        self.messageButton.backgroundColor = color
        return self
    }
    
    ///Set Zingle message font.
    public func messageFont(font: UIFont!) -> Self {
        self.messageButton.titleLabel?.font = font
        return self
    }
    
    ///Handle Zinlge completion.
    public func completion(_ completion: @escaping () -> Void) -> Self {
        self.completion = completion
        return self
    }
    
    ///Show Zingle.
    public func show() {
        self.adjustView()
        
        self.startAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                self.finishAnimating()
            }
        }
    }
}

// MARK: animation functions
extension Zingle {
    
    fileprivate func startAnimation(completion: @escaping () -> Void) {
        
        guard !self.isZingleShowing else {
            return
        }
        
        self.isZingleShowing = true
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, animations: {
            self.frame.origin.y = self.unhideYPositionForZingle
            self.layoutIfNeeded()
        }) { _ in
            completion()
        }
    }
    
    fileprivate func finishAnimating() {
        UIView.animate(withDuration: duration, animations: {
            self.frame.origin.y = self.hiddenYPositionForZingle
            self.alpha = 0.0
            self.layoutIfNeeded()
        }) { _ in
            self.isZingleShowing = false
            self.completion?()
        }
    }
}

// MARK: manage window hierarchy functions
extension Zingle {
    
    fileprivate func adjustView() {
        self.addZingleViewInWindow()
    }
    
    fileprivate func addZingleViewInWindow() {
        guard let keyWindow = UIApplication.shared.keyWindow,
            let rootViewController = keyWindow.rootViewController as? UINavigationController else {
                return
        }
        let navigationBar = rootViewController.navigationBar
        rootViewController.view.insertSubview(self, belowSubview: navigationBar)
    }
}

// MARK: Extensions
fileprivate extension UIColor {
    static var backgroundColor: UIColor {
        return UIColor(red: 35/255, green: 8/255, blue: 18/255, alpha: 1)
    }
}

fileprivate extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
        let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount*factor, bottom: 0, right: insetAmount*factor)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount*factor, bottom: 0, right: -insetAmount*factor)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}
