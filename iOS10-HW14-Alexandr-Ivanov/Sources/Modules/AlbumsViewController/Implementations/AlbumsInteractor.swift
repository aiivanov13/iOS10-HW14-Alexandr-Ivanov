//
//  AlbumsInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import Foundation

final class AlbumsInteractor {
    weak var presenter: AlbumsInteractorOutput?

    private var sectionModels: [SectionModel]?

    required init(presenter: AlbumsInteractorOutput) {
        self.presenter = presenter
    }

    private func getModel() {
        sectionModels = SectionModel.sectionModels
    }
}

// MARK: - AlbumsInteractorInput

extension AlbumsInteractor: AlbumsInteractorInput {
    func loadData() {
        getModel()
    }

    func getSectionCount() -> Int {
        sectionModels?.count ?? 0
    }

    func getItemsCount(section: Int) -> Int {
        sectionModels?[section].items.count ?? 0
    }

    func getItem(section: Int, row: Int) -> ItemModel {
        sectionModels?[section].items[row] ?? ItemModel(title: "", filesCount: 0)
    }

    func getLastItem(section: Int) -> ItemModel {
        sectionModels?[section].items.last ?? ItemModel(title: "", filesCount: 0)
    }

    func getSectionTitle(section: Int) -> String {
        sectionModels?[section].title ?? ""
    }

    func getSectionButtonIsHidden(section: Int) -> Bool {
        sectionModels?[section].buttonIsHidden ?? true
    }
}
