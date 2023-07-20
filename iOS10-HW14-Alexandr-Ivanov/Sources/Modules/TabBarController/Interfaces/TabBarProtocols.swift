//
//  TabBarProtocols.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

// Presenter -> View
protocol TabBarViewInput: AnyObject {
    func display(_ viewControllers: [UIViewController])
}

// View -> Presenter
protocol TabBarViewOutput: AnyObject {
    func setupViewControllers()
}

// Presenter -> Interactor
protocol TabBarInteractorInput: AnyObject {

}

// Interactor -> Presenter
protocol TabBarInteractorOutput: AnyObject {

}

// Presenter -> Router
protocol TabBarRouterInput: AnyObject {
    func getViewControllers() -> [UIViewController]
}
