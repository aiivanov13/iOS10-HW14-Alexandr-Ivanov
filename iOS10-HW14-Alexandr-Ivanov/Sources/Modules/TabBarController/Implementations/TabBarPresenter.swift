//
//  TabBarPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class TabBarPresenter {
    weak var view: TabBarViewInput?
    var interactor: TabBarInteractorInput?
    var router: TabBarRouterInput?

    required init(view: TabBarViewInput) {
        self.view = view
    }
}

// MARK: - TabBarViewOutput

extension TabBarPresenter: TabBarViewOutput {
    func setupViewControllers() {
        guard let controllers = self.router?.getViewControllers() else {
            return
        }
        self.view?.display(controllers)
    }
}

// MARK: - TabBarInteractorOutput

extension TabBarPresenter: TabBarInteractorOutput {

}
