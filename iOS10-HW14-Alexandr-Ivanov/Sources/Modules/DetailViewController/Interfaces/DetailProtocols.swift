//
//  DetailProtocols.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

// Presenter -> View
protocol DetailViewInput: AnyObject {
    func setImage(with image: UIImage)
}

// View -> Presenter
protocol DetailViewOutput: AnyObject {
    func backButtonTapped()
    func getImage()
}

// Presenter -> Interactor
protocol DetailInteractorInput: AnyObject {
}

// Interactor -> Presenter
protocol DetailInteractorOutput: AnyObject {
}

// Presenter -> Router
protocol DetailRouterInput: AnyObject {
    func popDetailView()
}
