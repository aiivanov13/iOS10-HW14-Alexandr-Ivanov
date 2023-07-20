//
//  AlbumsRouter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class AlbumsRouter {
    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - AlbumsRouterInput

extension AlbumsRouter: AlbumsRouterInput {
    func pushDetailView(with image: UIImage) {
        let detail = DetailModule().makeModule(with: image)
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
