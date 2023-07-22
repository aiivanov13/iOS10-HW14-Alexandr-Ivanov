//
//  AlbumsModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class AlbumsModule {
    func makeModule() -> UIViewController {
        let viewController = AlbumsView()
        let presenter = AlbumsPresenter(view: viewController)
        let interactor = AlbumsInteractor(presenter: presenter)
        let router = AlbumsRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
