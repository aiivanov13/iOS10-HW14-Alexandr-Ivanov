//
//  ForYouModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class ForYouModule {
    func makeModule() -> UIViewController {
        let viewController = ForYouView()
        let presenter = ForYouPresenter(view: viewController)
        let interactor = ForYouInteractor(presenter: presenter)
        let router = ForYouRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
