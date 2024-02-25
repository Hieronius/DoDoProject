import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        delegate = self
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        
        let menuVC = MenuScreenVC()
        let menuIcon = UITabBarItem(
            title: "Меню",
            image: UIImage(named: "pizzaIcon")?.resize(withSize: CGSize(width: 30, height: 30)),
            selectedImage: UIImage(named: "pizzaSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        )
        menuVC.tabBarItem = menuIcon
        
        let profileVC = ProfileScreenVC()
        let profileIcon = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profileIcon")?.resize(withSize: CGSize(width: 30, height: 30)),
            selectedImage: UIImage(named: "profileSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        )
        profileVC.tabBarItem = profileIcon
        
        let contactsVC = ContactsScreenVC()
        let contactsIcon = UITabBarItem(
            title: "Контакты",
            image: UIImage(named: "contactsIcon")?.resize(withSize: CGSize(width: 30, height: 30)),
            selectedImage: UIImage(named: "contactsSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        )
        contactsVC.tabBarItem = contactsIcon
        
        let basketVC = BasketScreenVC()
        let basketIcon = UITabBarItem(
            title: "Корзина",
            image: UIImage(named: "basketIcon")?.resize(withSize: CGSize(width: 30, height: 30)),
            selectedImage: UIImage(named: "basketSelectedIcon")?.resize(withSize: CGSize(width: 30, height: 30))
        )
        basketVC.tabBarItem = basketIcon
        
        let detailVC = DetailScreenVC()
        let detailIcon = UITabBarItem(title: "Добавить",
                                      image: UIImage(systemName: "plus"),
                                      selectedImage: UIImage(systemName: "plus.fill"))
        detailVC.tabBarItem = detailIcon
        
        let controllers = [menuVC, detailVC, profileVC, contactsVC, basketVC]
        self.viewControllers = controllers
    }

}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}

