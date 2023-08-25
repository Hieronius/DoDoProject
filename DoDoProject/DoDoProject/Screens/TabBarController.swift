//
//  ViewController.swift
//  DoDoProject
//
//  Created by Арсентий Халимовский on 28.07.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabBarIcons()
    }
    
    private func setupTabBar() {
        delegate = self
        
        self.tabBar.backgroundColor = .white
        
        let menuVC = MenuScreenVC()
        let menuIcon = UITabBarItem(title: "Меню",
                                    image: UIImage(systemName: "fork.knife"),
                                    selectedImage: UIImage(systemName: "fork.knife.fill"))
        menuVC.tabBarItem = menuIcon
        
        let profileVC = ProfileScreenVC()
        let profileIcon = UITabBarItem(title: "Профиль",
                                       image: UIImage(systemName: "person.crop.circle"),
                                       selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        profileVC.tabBarItem = profileIcon
        
        let contactsVC = ContactsScreenVC()
        let contactsIcon = UITabBarItem(title: "Контакты",
                                        image: UIImage(systemName: "map"),
                                        selectedImage: UIImage(systemName: "map.fill"))
        contactsVC.tabBarItem = contactsIcon
        
        let basketVC = BasketScreenVC()
        let basketIcon = UITabBarItem(title: "Корзина",
                                      image: UIImage(systemName: "cart"),
                                      selectedImage: UIImage(systemName: "cart.fill"))
        basketVC.tabBarItem = basketIcon
        
        let controllers = [menuVC, profileVC, contactsVC, basketVC]
        self.viewControllers = controllers
    }
    
    private func setupTabBarIcons() {
        guard let items = tabBar.items else { return }
        
        items[0].selectedImage = UIImage(named: "pizzaSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[0].image = UIImage(named: "pizzaIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        
        items[1].selectedImage = UIImage(named: "profileSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[1].image = UIImage(named: "profileIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        
        items[2].selectedImage = UIImage(named: "contactsSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[2].image = UIImage(named: "contactsIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        
        items[3].selectedImage = UIImage(named: "basketSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        items[3].image = UIImage(named: "basketIcon")?.resize(withSize: CGSize(width: 30, height: 30))
    }

}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}

