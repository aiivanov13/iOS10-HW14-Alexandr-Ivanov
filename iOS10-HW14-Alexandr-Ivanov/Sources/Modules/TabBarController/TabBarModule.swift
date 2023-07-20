//
//  TabBarModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

class TabBarModule: TabBarConfiguratorInput {
    func configure(with viewController: TabBarView) -> UIViewController {
        let presenter = TabBarPresenter(view: viewController)
        let interactor = TabBarInteractor(presenter: presenter)
        let router = TabBarRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
