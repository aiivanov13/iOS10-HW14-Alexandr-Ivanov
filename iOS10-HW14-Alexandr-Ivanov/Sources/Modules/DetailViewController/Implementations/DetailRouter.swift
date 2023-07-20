//
//  DetailRouter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class DetailRouter {
    weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - DetailRouterInput

extension DetailRouter: DetailRouterInput {
    func popDetailView() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
