//
//  MenuItem.swift
//  HamburgerMenu
//
//  Created by Mary Martinez on 1/7/17.
//  Copyright © 2017 Mary Martinez. All rights reserved.
//

import Foundation

struct MenuItem {
    var title: String
    var iconName: IconName
    var iconFilledName: IconName
    var iconColorName: IconName

    init(title: String, iconName: IconName, iconFilledName: IconName, iconColorName: IconName) {
        self.title = title
        
        self.iconName = iconName
        self.iconFilledName = iconFilledName
        self.iconColorName = iconColorName
    }
}

extension MenuItem: Equatable {
    static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.title == rhs.title
    }
}

enum IconName: String {
    case circle, circleFilled, circleColor
    case triangle, triangleFilled, triangleColor
}
