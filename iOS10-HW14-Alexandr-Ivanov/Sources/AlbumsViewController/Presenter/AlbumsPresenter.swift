//
//  AlbumsPresenter.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import UIKit

class AlbumsPresenter: NSObject {
    weak var view: AlbumsViewInput?
    var interactor: AlbumsInteractorInput?
    var router: AlbumsRouterInput?

    private var sectionModels: [SectionModel]?

    required init(view: AlbumsViewInput) {
        self.view = view
    }

    private func loadSectionModels() {
        interactor?.getSectionModel()
    }
}

// MARK: - AlbumsViewOutput

extension AlbumsPresenter: AlbumsViewOutput {
    func configureView() {
        self.loadSectionModels()
    }

    func pullItemsCount(section: Int) -> Int {
        sectionModels?[section].items.count ?? 0
    }
}

// MARK: - AlbumsInteractorOutput

extension AlbumsPresenter: AlbumsInteractorOutput {
    func fetchSectionModel(with data: [SectionModel]) {
        sectionModels = data
    }
}

// MARK: - UICollectionView DataSource

extension AlbumsPresenter: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sectionModels?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionModels?[section].items.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = sectionModels?[indexPath.section].items[indexPath.row]

        switch indexPath.section {
        case 0...1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else { return UICollectionViewCell() }
            if item?.title == "Favorites" {
                cell.showFavorite()
            }
            cell.itemModel = item
            return cell
        case 2...3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.identifier, for: indexPath) as? TextCell else { return UICollectionViewCell()}
            if item == sectionModels?[indexPath.section].items.last {
                cell.hideSeparator()
            }
            if item?.title == "Hidden" || item?.title == "Recently Deleted" {
                cell.showLock()
            }
            cell.itemModel = item
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as? CellHeader else { return UICollectionReusableView() }
        header.title = sectionModels?[indexPath.section].title
        header.buttonIsHidden = sectionModels?[indexPath.section].buttonIsHidden
        return header
    }
}

// MARK: - UICollectionView Delegate

extension AlbumsPresenter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        router?.pushDetailView(with: sectionModels?[indexPath.section].items[indexPath.row] ?? ItemModel(title: "", filesCount: 0))
    }
}
