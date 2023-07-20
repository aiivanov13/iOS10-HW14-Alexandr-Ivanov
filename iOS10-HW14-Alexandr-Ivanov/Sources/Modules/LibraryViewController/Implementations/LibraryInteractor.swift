//
//  LibraryInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class LibraryInteractor {
    weak var presenter: LibraryInteractorOutput?

    required init(presenter: LibraryInteractorOutput) {
        self.presenter = presenter
    }
}

// MARK: - LibraryInteractorInput

extension LibraryInteractor: LibraryInteractorInput {

}
