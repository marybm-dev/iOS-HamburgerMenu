//
//  MenuViewController.swift
//  HamburgerMenu
//
//  Created by Mary Martinez on 1/7/17.
//  Copyright © 2017 Mary Martinez. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var hamburgerViewController: HamburgerViewController!
    
    var viewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // instantiate storyboards and navigation controllers
        let firstStoryboard = UIStoryboard(name: "First", bundle: nil)
        let secondstoryboard = UIStoryboard(name: "Second", bundle: nil)
        let firstNavigationController = firstStoryboard.instantiateViewController(withIdentifier: "FirstNavigationController")
        let secondNavigationController = secondstoryboard.instantiateViewController(withIdentifier: "SecondNavigationController")
        
        viewControllers = [firstNavigationController, secondNavigationController]
        hamburgerViewController.contentViewController = firstNavigationController
    }

}
