//
//  AlbumsRouter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

class AlbumsRouter {
    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - AlbumsRouterInput

extension AlbumsRouter: AlbumsRouterInput {
    func pushDetailView(with item: ItemModel) {
        viewController?.navigationController?.pushViewController(DetailView(), animated: true)
    }
}
