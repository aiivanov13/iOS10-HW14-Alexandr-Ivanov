//
//  DetailProtocols.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

// Presenter -> View
protocol DetailViewInput: AnyObject {
}

// View -> Presenter
protocol DetailViewOutput: AnyObject {
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

// Configurator
protocol DetailConfiguratorInput: AnyObject {
    func configure(with viewController: DetailView) -> UIViewController
}
