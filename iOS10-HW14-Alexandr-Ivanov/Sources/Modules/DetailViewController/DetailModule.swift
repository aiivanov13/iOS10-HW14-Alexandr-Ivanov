//
//  DetailModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class DetailModule {
    func makeModule(with image: UIImage) -> UIViewController {
        let viewController = DetailView()
        let presenter = DetailPresenter(view: viewController)
        let interactor = DetailInteractor(presenter: presenter, image: image)
        let router = DetailRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
