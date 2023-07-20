//
//  DetailInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class DetailInteractor {
    weak var presenter: DetailInteractorOutput?

    required init(presenter: DetailInteractorOutput) {
        self.presenter = presenter
    }
}

// MARK: - DetailInteractorInput

extension DetailInteractor: DetailInteractorInput {

}
