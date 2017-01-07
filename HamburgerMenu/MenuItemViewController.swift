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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
}
