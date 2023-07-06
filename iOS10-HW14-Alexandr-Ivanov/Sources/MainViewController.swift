//
//  MainViewController.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 03.07.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private var sectionModels: [SectionModel]?

    // MARK: - Outlets

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TextCell.self, forCellWithReuseIdentifier: TextCell.identifier)
        collection.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collection.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier)
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false

        return collection
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        sectionModels = SectionModel.sectionModels
        setupNavigationView()
        setupView()
        setupHeirarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupNavigationView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .add)
    }

    private func setupView() {
        title = "Albums"
        view.backgroundColor = .white
    }

    private func setupHeirarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { $0.trailing.leading.top.bottom.equalTo(view) }
    }

    // MARK: - Collection Layout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.5)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 10,
                                                                   trailing: 0)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .fractionalWidth(1.2)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    repeatingSubitem: layoutItem,
                    count: 2
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 5,
                                                                    bottom: 0,
                                                                    trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 6,
                                                                      bottom: 10,
                                                                      trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .paging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.width - 6),
                                                                     heightDimension: .estimated(48))

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 10,
                                                                   trailing: 0)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .fractionalWidth(0.6)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    repeatingSubitem: layoutItem,
                    count: 1
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 5,
                                                                    bottom: 0,
                                                                    trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 6,
                                                                      bottom: 10,
                                                                      trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .paging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.width - 6),
                                                                     heightDimension: .estimated(48))

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(44)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 0,
                                                                   trailing: 0)

                let groupHeight = itemSize.heightDimension.dimension * CGFloat((self.sectionModels?[section].item.count ?? 0))

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(self.view.frame.width - 6),
                    heightDimension: .absolute(groupHeight)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    repeatingSubitem: layoutItem,
                    count: self.sectionModels?[section].item.count ?? 0
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 5,
                    bottom: 0,
                    trailing: 0
                )

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 6,
                                                                      bottom: 20,
                                                                      trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .none

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute(self.view.frame.width - 6),
                                                                     heightDimension: .estimated(48))

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

                return layoutSection
            }
        }
    }
}

// MARK: - UICollectionView DataSource

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sectionModels?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionModels?[section].item.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = sectionModels?[indexPath.section].item[indexPath.row]

        switch indexPath.section {
        case 0...1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else { return UICollectionViewCell()}
            if item?.title == "Favorites" {
                cell.showFavorite()
            }
            cell.itemModel = item
            return cell
        case 2...3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.identifier, for: indexPath) as? TextCell else { return UICollectionViewCell()}
            if item == sectionModels?[indexPath.section].item.last {
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
        header.buttonIsHiden = sectionModels?[indexPath.section].buttonIsHiden
        return header
    }
}

// MARK: - UICollectionView Delegate

extension MainViewController: UICollectionViewDelegate {

}
