//
//  DetailPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class DetailPresenter {
    weak var view: DetailViewInput?
    var interactor: DetailInteractorInput?
    var router: DetailRouterInput?

    var image: UIImage?

    required init(view: DetailViewInput, image: UIImage) {
        self.view = view
        self.image = image
    }
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
    func getImage() {
        view?.setImage(with: image ?? UIImage())
    }

    func backButtonTapped() {
        router?.popDetailView()
    }
}

// MARK: - DetailInteractorOutput

extension DetailPresenter: DetailInteractorOutput {

}
