//
//  TabBarRouter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class TabBarRouter {
    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - TabBarRouterInput

extension TabBarRouter: TabBarRouterInput {
    func getViewControllers() -> [UIViewController] {
        [
            LibraryModule().makeModule(),
            ForYouModule().makeModule(),
            AlbumsModule().makeModule(),
            SearchModule().makeModule()
        ].map { UINavigationController(rootViewController: $0) }
    }
}
