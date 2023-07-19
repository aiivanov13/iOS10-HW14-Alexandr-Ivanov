//
//  AlbumsRouter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import UIKit

class Router {
    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - AlbumsRouterInput

extension Router: AlbumsRouterInput {
    func pushDetailView(with item: ItemModel) {
        viewController?.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
