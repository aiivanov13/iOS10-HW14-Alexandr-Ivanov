//
//  LibraryModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class LibraryModule {
    func makeModule() -> UIViewController {
        let viewController = LibraryView()
        let presenter = LibraryPresenter(view: viewController)
        let interactor = LibraryInteractor(presenter: presenter)
        let router = LibraryRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
