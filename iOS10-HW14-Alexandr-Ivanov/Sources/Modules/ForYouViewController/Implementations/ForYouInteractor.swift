//
//  ForYouInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class ForYouInteractor {
    weak var presenter: ForYouInteractorOutput?

    required init(presenter: ForYouInteractorOutput) {
        self.presenter = presenter
    }
}

// MARK: - ForYouInteractorInput

extension ForYouInteractor: ForYouInteractorInput {

}
