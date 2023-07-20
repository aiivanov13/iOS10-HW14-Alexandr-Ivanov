//
//  TabBarView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

final class TabBarView: UITabBarController {
    var presenter: TabBarViewOutput?

    private func configureTabBarView() {
        self.selectedIndex = 2
        self.tabBar.tintColor = .systemBlue
        self.tabBar.backgroundColor = UIColor.init { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        }
        self.tabBar.isTranslucent = true
    }

    private func createTabBarItems() -> [UITabBarItem] {
        [
            UITabBarItem(title: "Library", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0),
            UITabBarItem(title: "For You", image: UIImage(systemName: "heart.text.square.fill"), tag: 1),
            UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2),
            UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        ]
    }
}

// MARK: - TabBarViewInput

extension TabBarView: TabBarViewInput {
    func display(_ viewControllers: [UIViewController]) {
        let items = createTabBarItems()

        for viewController in viewControllers {
            viewController.tabBarItem = items[viewControllers.firstIndex(of: viewController) ?? 0]
        }
        self.viewControllers = viewControllers
        configureTabBarView()
    }
}
