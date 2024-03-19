// com.GAITApp


//
//  AppDelegate.swift
//  GAIT
//
//  Created by Shyam on 05/11/20.
//  Copyright © 2020 EVS. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

let MyAppDelegate = (UIApplication.shared.delegate as! AppDelegate)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        application.statusBarStyle = .lightContent
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
        return true
    }
}

/*
 
 hyptechnologies@gmail.com
 Jaredlee123$

 ================

 hipdemand@gmail.com
 Jaredlee123$

 ===============

*/

