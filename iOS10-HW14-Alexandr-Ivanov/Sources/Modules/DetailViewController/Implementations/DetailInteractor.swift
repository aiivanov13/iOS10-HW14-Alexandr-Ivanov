//
//  DetailInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import UIKit

final class DetailInteractor {
    weak var presenter: DetailInteractorOutput?

    private var image: UIImage?

    required init(presenter: DetailInteractorOutput, image: UIImage) {
        self.presenter = presenter
        self.image = image
    }
}

// MARK: - DetailInteractorInput

extension DetailInteractor: DetailInteractorInput {
    func getImage() -> UIImage {
        image ?? UIImage()
    }
}
