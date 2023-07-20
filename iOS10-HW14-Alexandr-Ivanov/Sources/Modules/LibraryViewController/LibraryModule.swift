//
//  LibraryModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

class LibraryModule: LibraryConfiguratorInput {
    func configure(with viewController: LibraryView) -> UIViewController {
        let presenter = LibraryPresenter(view: viewController)
        let interactor = LibraryInteractor(presenter: presenter)
        let router = LibraryRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
