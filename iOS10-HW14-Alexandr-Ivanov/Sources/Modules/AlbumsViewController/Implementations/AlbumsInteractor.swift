//
//  AlbumsInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import Foundation

final class AlbumsInteractor {
    weak var presenter: AlbumsInteractorOutput?

    required init(presenter: AlbumsInteractorOutput) {
        self.presenter = presenter
    }

    private func getSectionModel() -> [SectionModel] {
        SectionModel.sectionModels
    }
}

// MARK: - AlbumsInteractorInput

extension AlbumsInteractor: AlbumsInteractorInput {
    func getSectionModel() {
        presenter?.fetchSectionModel(with: getSectionModel())
    }
}
