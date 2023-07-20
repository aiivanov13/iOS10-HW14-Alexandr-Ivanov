//
//  TabBarView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

final class TabBarView: UITabBarController {
    var presenter: TabBarViewOutput?

    static func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        tabBarController.setViewControllers(
            [
                createChildViewController(controller: LibraryView(), title: "Library", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0),
                createChildViewController(controller: ForYouView(), title: "For You", image: UIImage(systemName: "heart.text.square.fill"), tag: 1),
                createChildViewController(controller: AlbumsView(), title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2),
                createChildViewController(controller: SearchView(), title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 3)
            ],
            animated: true
        )
        
        tabBarController.selectedIndex = 2
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.backgroundColor = UIColor.init { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        }
        tabBarController.tabBar.isTranslucent = true
        
        return tabBarController
    }

    private static func createChildViewController(controller: UIViewController, title: String, image: UIImage?, tag: Int) -> UIViewController {
        let viewController = controller
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        viewController.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.isTranslucent = true

        return navigationController
    }
}

extension TabBarView: TabBarViewInput {
    func display(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }
}
