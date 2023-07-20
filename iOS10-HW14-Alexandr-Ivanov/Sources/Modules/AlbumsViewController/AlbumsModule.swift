//
//  AlbumsModule.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

class AlbumsModule: AlbumsConfiguratorInput {
    func configure(with viewController: AlbumsView) -> UIViewController {
        let presenter = AlbumsPresenter(view: viewController)
        let interactor = AlbumsInteractor(presenter: presenter)
        let router = Router(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        viewController.collectionView.dataSource = presenter
        viewController.collectionView.delegate = presenter
        return viewController
    }
}
