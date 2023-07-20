//
//  LibraryPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class LibraryPresenter {
    weak var view: LibraryViewInput?
    var interactor: LibraryInteractorInput?
    var router: LibraryRouterInput?

    required init(view: LibraryViewInput) {
        self.view = view
    }
}

// MARK: - LibraryViewOutput

extension LibraryPresenter: LibraryViewOutput {

}

// MARK: - LibraryInteractorOutput

extension LibraryPresenter: LibraryInteractorOutput {

}
