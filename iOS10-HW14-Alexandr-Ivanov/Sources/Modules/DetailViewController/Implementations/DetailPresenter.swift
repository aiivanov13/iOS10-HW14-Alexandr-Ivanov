//
//  DetailPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class DetailPresenter {
    weak var view: DetailViewInput?
    var interactor: DetailInteractorInput?
    var router: DetailRouterInput?

    required init(view: DetailViewInput) {
        self.view = view
    }
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
    func pullImage() {
        guard let image = interactor?.getImage() else { return }
        view?.setImage(with: image)
    }

    func backButtonTapped() {
        router?.popDetailView()
    }
}

// MARK: - DetailInteractorOutput

extension DetailPresenter: DetailInteractorOutput {

}
