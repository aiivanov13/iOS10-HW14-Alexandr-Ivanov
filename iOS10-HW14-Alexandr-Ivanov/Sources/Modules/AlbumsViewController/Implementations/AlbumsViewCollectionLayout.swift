//
//  CreateLayoutExtension.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 09.07.2023.
//

import UIKit

extension AlbumsView {
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] (section, _) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.5)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 0)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .fractionalWidth(1.2)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 2
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 10, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .paging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .absolute((self?.view.frame.width ?? 0) - 6),
                    heightDimension: .estimated(48)
                )

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 0)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .fractionalWidth(0.6)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 1
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 10, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .paging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .absolute((self?.view.frame.width ?? 0) - 6),
                    heightDimension: .estimated(48)
                )

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(44)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let groupHeight = itemSize.heightDimension.dimension * CGFloat(self?.presenter?.pullItemsCount(section: section) ?? 0)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute((self?.view.frame.width ?? 0) - 6),
                    heightDimension: .absolute(groupHeight)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: self?.presenter?.pullItemsCount(section: section) ?? 0
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .none

                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .absolute((self?.view.frame.width ?? 0) - 6),
                    heightDimension: .estimated(48)
                )

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            }
        }
    }
}
