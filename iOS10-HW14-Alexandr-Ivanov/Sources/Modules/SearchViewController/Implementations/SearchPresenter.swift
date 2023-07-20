//
//  SearchPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class SearchPresenter {
    weak var view: SearchViewInput?
    var interactor: SearchInteractorInput?
    var router: SearchRouterInput?

    required init(view: SearchViewInput) {
        self.view = view
    }
}

// MARK: - SearchViewOutput

extension SearchPresenter: SearchViewOutput {

}

// MARK: - SearchInteractorOutput

extension SearchPresenter: SearchInteractorOutput {

}
