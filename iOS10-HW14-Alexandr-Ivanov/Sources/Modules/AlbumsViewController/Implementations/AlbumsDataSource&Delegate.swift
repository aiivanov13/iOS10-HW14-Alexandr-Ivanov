//
//  AlbumsDataSource&Delegate.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 22.07.2023.
//

import UIKit

// MARK: - UICollectionView DataSource

extension AlbumsView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter?.pullSectionCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.pullItemsCount(section: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = presenter?.pullItem(section: indexPath.section, row: indexPath.row)

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
            if item == presenter?.pullLastItem(section: indexPath.section) {
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
        header.title = presenter?.pullSectionTitle(section: indexPath.section)
        header.buttonIsHidden = presenter?.pullSectionButtonIsHidden(section: indexPath.section)
        return header
    }
}

// MARK: - UICollectionView Delegate

extension AlbumsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter?.itemTapped(section: indexPath.section, row: indexPath.row)
    }
}
