//
//  AppDelegate.swift
//  HamburgerMenu
//
//  Created by Mary Martinez on 1/7/17.
//  Copyright © 2017 Mary Martinez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let hamburgerVC = storyboard.instantiateViewController(withIdentifier: "HamburgerViewController") as! HamburgerViewController
        let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController

        menuVC.hamburgerViewController = hamburgerVC
        hamburgerVC.menuViewController = menuVC

        window?.rootViewController = hamburgerVC
        
        return true
    }

}

