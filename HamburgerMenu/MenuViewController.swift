//
//  MenuViewController.swift
//  HamburgerMenu
//
//  Created by Mary Martinez on 1/7/17.
//  Copyright © 2017 Mary Martinez. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var hamburgerViewController: HamburgerViewController!
    
    var viewControllers = [UIViewController]()
    var menuItems = [MenuItem]()
    
    var selectedMenuItem: MenuItem!
    
    // Collection View Cell boundaries
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        roundAvatarImageView()
        
        // update constraint to be off center to the left (because of hamburger contentView exposure)
        centerConstraint.constant -= 25
    }
    
    func roundAvatarImageView() {
        avatarImageView.layoutIfNeeded()
        let radius = avatarImageView.frame.size.width / 2
        avatarImageView.layer.cornerRadius = radius
        avatarImageView.layer.borderColor = UIColor.gray.cgColor
        avatarImageView.layer.borderWidth = 2.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.clipsToBounds = true
    }
    
    func setupNavigationBar() {
        // register menuItem cells
        let nib = UINib(nibName: "MenuItemCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "MenuItemCell")
        
        // init storyboards
        let firstStoryboard = UIStoryboard(name: "First", bundle: nil)
        let secondstoryboard = UIStoryboard(name: "Second", bundle: nil)
        
        // init navigation controllers
        let firstNavigationController = firstStoryboard.instantiateViewController(withIdentifier: "FirstNavigationController")
        let secondNavigationController = secondstoryboard.instantiateViewController(withIdentifier: "SecondNavigationController")
        
        // init menu items
        let firstItem = MenuItem(title: "First Item", iconName: .circle, iconFilledName: .circleFilled, iconColorName: .circleColor)
        let secondItem = MenuItem(title: "Second Item", iconName: .triangle, iconFilledName: .triangleFilled, iconColorName: .triangleColor)
        menuItems = [firstItem, secondItem]
        selectedMenuItem = firstItem
        
        // add menu item to view controllers
        (firstNavigationController.childViewControllers.first as? FirstViewController)?.menuItem = firstItem
        (secondNavigationController.childViewControllers.first as? SecondViewController)?.menuItem = secondItem
        
        (firstNavigationController.childViewControllers.first as? FirstViewController)?.hamburgerViewController = hamburgerViewController
        (secondNavigationController.childViewControllers.first as? SecondViewController)?.hamburgerViewController = hamburgerViewController
        
        viewControllers = [firstNavigationController, secondNavigationController]
        hamburgerViewController.contentViewController = firstNavigationController
    }

}

// Mark: UICollectionViewDatasource
extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCell", for: indexPath) as! MenuItemCollectionViewCell
        
        let menuItem = menuItems[indexPath.row]
        cell.menuItem = menuItem
        
        guard selectedMenuItem != nil else { return cell }
        cell.isCurrentMenuItem = (selectedMenuItem == menuItem) ? true : false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let cell = collectionView.cellForItem(at: indexPath) as! MenuItemCollectionViewCell
        let menuItem = cell.menuItem
        self.selectedMenuItem = menuItem
        
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = self.sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.sectionInsets.left
    }
}
