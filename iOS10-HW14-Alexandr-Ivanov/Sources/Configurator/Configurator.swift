//
//  Configurator.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 19.07.2023.
//

import Foundation

class Configurator {
}

// MARK: - AlbumsConfiguratorProtocol

extension Configurator: AlbumsConfiguratorInput {
    func configure(with viewController: AlbumsViewController) {
        let presenter = AlbumsPresenter(view: viewController)
        let interactor = AlbumsInteractor(presenter: presenter)
        let router = Router(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        viewController.collectionView.dataSource = presenter
        viewController.collectionView.delegate = presenter
    }
}
