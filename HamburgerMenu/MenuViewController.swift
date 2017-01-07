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
    var menuItems = [MenuItem]()
    
    var selectedMenuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init storyboards
        let firstStoryboard = UIStoryboard(name: "First", bundle: nil)
        let secondstoryboard = UIStoryboard(name: "Second", bundle: nil)
        
        // init navigation controllers
        let firstNavigationController = firstStoryboard.instantiateViewController(withIdentifier: "FirstNavigationController")
        let secondNavigationController = secondstoryboard.instantiateViewController(withIdentifier: "SecondNavigationController")
        
        // init menu items
        let firstItem = MenuItem(title: "First", iconName: .circle, iconFilledName: .circleFilled, iconColorName: .circleColor)
        let secondItem = MenuItem(title: "Second", iconName: .triangle, iconFilledName: .triangleFilled, iconColorName: .triangleColor)
        menuItems = [firstItem, secondItem]
        selectedMenuItem = firstItem
        
        // add menu item to view controllers
        (firstNavigationController.childViewControllers.first as? FirstViewController)?.menuItem = firstItem
        (secondNavigationController.childViewControllers.first as? SecondViewController)?.menuItem = secondItem
        
        viewControllers = [firstNavigationController, secondNavigationController]
        hamburgerViewController.contentViewController = firstNavigationController
    }

}
