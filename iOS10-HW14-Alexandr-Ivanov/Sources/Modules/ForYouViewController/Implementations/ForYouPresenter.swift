//
//  ForYouPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class ForYouPresenter {
    weak var view: ForYouViewInput?
    var interactor: ForYouInteractorInput?
    var router: ForYouRouterInput?

    required init(view: ForYouViewInput) {
        self.view = view
    }
}

// MARK: - ForYouViewOutput

extension ForYouPresenter: ForYouViewOutput {

}

// MARK: - ForYouInteractorOutput

extension ForYouPresenter: ForYouInteractorOutput {

}
