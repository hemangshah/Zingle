# Zingle

Zingle – An alert will display underneath your UINavigationBar 🎅

💥 **Note:** Zingle has a dependency to have a `UINavigationController` in your app, which means it will not work/display in your app if you don't have a `UINavigationController` linked to a `UIViewController` in which you're planning to show an alert. However, it will get display even if the `UINavigationBar` is hidden for a particular `UIViewController`.

[![Build Status](https://travis-ci.org/hemangshah/Zingle.svg?branch=master)](https://travis-ci.org/hemangshah/Zingle)
![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)
![Platform](https://img.shields.io/badge/Platforms-iOS-red.svg)
![Swift 4.x](https://img.shields.io/badge/Swift-4.x-blue.svg)
![CocoaPods](https://img.shields.io/cocoapods/dt/Zingle.svg)
![MadeWithLove](https://img.shields.io/badge/Made%20with%20%E2%9D%A4-India-green.svg)
[![Awesome-Swift](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/matteocrippa/awesome-swift/)

1. [Screenshots](#screenshots)
2. [Features](#features)
3. [Installation](#installation)
4. [Setup](#setup)
5. [Usage](#usage)
6. [Credits](#credits)
7. [Thanks](#thank-you)
8. [License](#license)

## Screenshots

<table>
<tr>
<td align="center"><img src = "https://github.com/hemangshah/Zingle/blob/master/Screenshots/Screenshot-1.png" alt = "iPhone8+"></td>
<td align="center"><img src = "https://github.com/hemangshah/Zingle/blob/master/Screenshots/Screenshot-2.png" alt = "iPhoneX"></td></tr>
<tr><td align="center" colspan="2"><img src = "https://github.com/hemangshah/Zingle/blob/master/Screenshots/Screenshot-1-landscape.png" alt = "Landscape"></td></tr>
</table>

## Features

1. Easy to setup & Use
2. Dynamic Property Configurations.
3. Lightweight with zero dependencies.

## Installation

1. **Manually** – Add `Zingle.swift` file to your Project.<br>
2. **CocoaPods** – `pod 'Zingle'`
    
> You can read the [CHANGELOG](https://github.com/hemangshah/Zingle/blob/master/CHANGELOG.md) file for a particular release.

## Setup

````swift
import Zingle
````

## Usage

````swift
Zingle.init(duration: 0.5, delay: 3)
  .message(message: "No Internet Connection.")
  .messageIcon(icon: #imageLiteral(resourceName: "warning-icon"))
  .messageColor(color: .white)
  .messageFont(font: UIFont.init(name: "AmericanTypewriter", size: 15.0)!)
  .backgroundColor(color: UIColor.red)
  .show()
````

You can also use it with in-built extension to `UIViewController`.

````swift
//Create ZingleConfig.
let config = ZingleConfig()
config.delay = 2.0
config.duration = 1.0
config.messageColor = UIColor.white
config.messageFont = UIFont.init(name: "AmericanTypewriter", size: 15.0)!
config.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        
//Show Zingle with `self` (UIViewController) with custom configuration.
self.zingle(message: "No Internet Connection.", withConfig: config)

//or

//Show Zingle with `self` (UIViewController) with default configuration.
self.zingle(message: "No Internet Connection.")

````
You can [watch](https://github.com/hemangshah/Zingle/subscription) to <b>Zingle</b> to see continuous updates. Stay tuned.

<b>Have an idea for improvements of this class?
Please open an [issue](https://github.com/hemangshah/Zingle/issues/new).</b>
    
## Credits

<b>[Hemang Shah](https://about.me/hemang.shah)</b>

**You can shoot me an [email](http://www.google.com/recaptcha/mailhide/d?k=01IzGihUsyfigse2G9z80rBw==&c=vU7vyAaau8BctOAIJFwHVbKfgtIqQ4QLJaL73yhnB3k=) to contact.**
   
## Thank You!!

See the [contributions](https://github.com/hemangshah/Zingle/blob/master/CONTRIBUTIONS.md) for details.

## License

The MIT License (MIT)

> Read the [LICENSE](https://github.com/hemangshah/Zingle/blob/master/LICENSE) file for details.
