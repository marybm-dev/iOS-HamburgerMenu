//
//  MenuItemViewController.swift
//  HamburgerMenu
//
//  Created by Mary Martinez on 1/7/17.
//  Copyright © 2017 Mary Martinez. All rights reserved.
//

import UIKit

class MeuItemViewController: UIViewController {
    
    var menuItem: MenuItem! {
        didSet {
            navigationItem.titleView = setNavigationBarItem()
        }
    }
    
    var hamburgerBarButtonItem: UIBarButtonItem!
    var hamburgerViewController: HamburgerViewController!
    
    var menuIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHamburgerButton()
    }

    func setNavigationBarItem() -> UIButton {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let navBarTitleButton = UIButton(type: .custom)
        navBarTitleButton.setImage(UIImage(named: menuItem.iconColorName.rawValue), for: .normal)
        navBarTitleButton.setTitle(menuItem.title, for: .normal)
        navBarTitleButton.setTitleColor(UIColor.gray, for: .normal)
        navBarTitleButton.sizeToFit()
        
        return navBarTitleButton
    }
    
    func setHamburgerButton() {
        let hamburgerButton = UIButton(type: .custom)
        hamburgerButton.setImage(#imageLiteral(resourceName: "hamburger"), for: .normal)
        hamburgerButton.sizeToFit()
        hamburgerButton.addTarget(self, action: #selector(MeuItemViewController.toggleMenuOpen), for: .touchUpInside)
        
        hamburgerBarButtonItem = UIBarButtonItem(customView: hamburgerButton)
        navigationItem.leftBarButtonItem = hamburgerBarButtonItem
    }
    
    func toggleMenuOpen() {
        menuIsOpen = !menuIsOpen
        
        UIView.animate(withDuration: 0.3, animations: {
            if self.menuIsOpen { //opening
                self.hamburgerViewController.leftMarginConstraint.constant = self.view.frame.size.width - 50
            } else {            // closing
                self.hamburgerViewController.leftMarginConstraint.constant = 0
            }
            self.view.layoutIfNeeded()
        })
    }
}
