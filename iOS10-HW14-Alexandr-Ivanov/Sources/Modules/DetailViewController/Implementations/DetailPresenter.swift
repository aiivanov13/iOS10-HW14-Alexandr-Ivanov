//
//  DetailPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

class DetailPresenter {
    weak var view: DetailViewInput?
    var interactor: DetailInteractorInput?
    var router: DetailRouterInput?

    required init(view: DetailViewInput) {
        self.view = view
    }
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
}

// MARK: - DetailInteractorOutput

extension DetailPresenter: DetailInteractorOutput {
}
