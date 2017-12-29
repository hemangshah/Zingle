//
//  ViewController.swift
//  Zingle
//
//  Created by Hemang on 28/12/17.
//  Copyright © 2017 Hemang Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttonTapped(_ sender: Any) {
        Zingle.init(duration: 0.5, delay: 3)
            .message(message: "No Internet Connection.")
            //.messageIcon(icon: #imageLiteral(resourceName: "warning-icon"))
            .messageColor(color: .white)
            .messageFont(font: UIFont.init(name: "AmericanTypewriter", size: 15.0)!)
            .show()
    }
}
