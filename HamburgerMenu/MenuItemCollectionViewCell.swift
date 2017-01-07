//
//  MenuItemCollectionViewCell.swift
//  HamburgerMenu
//
//  Created by Mary Martinez on 1/7/17.
//  Copyright © 2017 Mary Martinez. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    var isCurrentMenuItem = false {
        didSet {
            self.setIcon()
        }
    }
    
    var menuItem: MenuItem! {
        didSet {
            iconLabel.text = menuItem.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setIcon() {
        iconImageView.image = UIImage(named: (isCurrentMenuItem) ? menuItem.iconFilledName.rawValue : menuItem.iconName.rawValue)
    }
}
