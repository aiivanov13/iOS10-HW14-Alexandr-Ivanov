//
//  TabBarRouter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

class TabBarRouter {
    weak var viewController: UIViewController?
    var configurator: TabBarConfiguratorInput?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - TabBarRouterInput

extension TabBarRouter: TabBarRouterInput {
    func getViewControllers() -> [UIViewController] {
        return []
    }
}
