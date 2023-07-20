//
//  SearchInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class SearchInteractor {
    weak var presenter: SearchInteractorOutput?

    required init(presenter: SearchInteractorOutput) {
        self.presenter = presenter
    }
}

// MARK: - SearchInteractorInput

extension SearchInteractor: SearchInteractorInput {

}
