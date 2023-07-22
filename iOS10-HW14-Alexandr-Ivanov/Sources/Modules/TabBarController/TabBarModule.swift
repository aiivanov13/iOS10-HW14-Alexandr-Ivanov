//
//  TabBarModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class TabBarModule {
    func makeModule() -> UIViewController {
        let viewController = TabBarView()
        let presenter = TabBarPresenter(view: viewController)
        let interactor = TabBarInteractor(presenter: presenter)
        let router = TabBarRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.setupViewControllers()
        return viewController
    }
}
