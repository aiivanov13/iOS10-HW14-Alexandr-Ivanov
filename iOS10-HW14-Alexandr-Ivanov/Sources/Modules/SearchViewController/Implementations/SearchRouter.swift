//
//  SearchRouter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

class SearchRouter {
    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - AlbumsRouterInput

extension SearchRouter: AlbumsRouterInput {
    func pushDetailView(with item: ItemModel) {
        <#code#>
    }
}
