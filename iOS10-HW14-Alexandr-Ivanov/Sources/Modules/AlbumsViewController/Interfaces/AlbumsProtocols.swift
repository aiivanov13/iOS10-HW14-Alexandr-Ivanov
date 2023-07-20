//
//  AlbumsProtocols.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import UIKit

// Presenter -> View
protocol AlbumsViewInput: AnyObject {

}

// View -> Presenter
protocol AlbumsViewOutput: AnyObject {
    func configureView()
    func pullItemsCount(section: Int) -> Int
}

// Presenter -> Interactor
protocol AlbumsInteractorInput: AnyObject {
    func getSectionModel()
}

// Interactor -> Presenter
protocol AlbumsInteractorOutput: AnyObject {
    func fetchSectionModel(with data: [SectionModel])
}

// Presenter -> Router
protocol AlbumsRouterInput: AnyObject {
    func pushDetailView(with image: UIImage)
}
