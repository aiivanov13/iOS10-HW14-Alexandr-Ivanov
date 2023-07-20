//
//  SearchModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

class SearchModule: SearchConfiguratorInput {
    func configure(with viewController: SearchView) -> UIViewController {
        let presenter = SearchPresenter(view: viewController)
        let interactor = SearchInteractor(presenter: presenter)
        let router = Router(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
