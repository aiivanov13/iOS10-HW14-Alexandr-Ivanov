//
//  AlbumsPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import Foundation

final class AlbumsPresenter {
    weak var view: AlbumsViewInput?
    var interactor: AlbumsInteractorInput?
    var router: AlbumsRouterInput?

    required init(view: AlbumsViewInput) {
        self.view = view
    }
}

// MARK: - AlbumsViewOutput

extension AlbumsPresenter: AlbumsViewOutput {
    func configureView() {
        interactor?.loadData()
    }

    func pullSectionCount() -> Int {
        interactor?.getSectionCount() ?? 0
    }

    func pullItemsCount(section: Int) -> Int {
        interactor?.getItemsCount(section: section) ?? 0
    }

    func pullItem(section: Int, row: Int) -> ItemModel {
        interactor?.getItem(section: section, row: row) ?? ItemModel(title: "", filesCount: 0)
    }

    func pullLastItem(section: Int) -> ItemModel {
        interactor?.getLastItem(section: section) ?? ItemModel(title: "", filesCount: 0)
    }

    func pullSectionTitle(section: Int) -> String {
        interactor?.getSectionTitle(section: section) ?? ""
    }

    func pullSectionButtonIsHidden(section: Int) -> Bool {
        interactor?.getSectionButtonIsHidden(section: section) ?? true
    }

    func itemTapped(section: Int, row: Int) {
        guard let image = interactor?.getItem(section: section, row: row).image else { return }
        router?.pushDetailView(with: image)
    }
}

// MARK: - AlbumsInteractorOutput

extension AlbumsPresenter: AlbumsInteractorOutput {

}


