//
//  AlbumsViewController.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 03.07.2023.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    private var sectionModels: [SectionModel]?
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout(sectionModels: sectionModels ?? [])
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .add)
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupHeirarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { $0.trailing.leading.top.bottom.equalTo(view) }
    }
}

// MARK: - UICollectionView DataSource

extension AlbumsViewController: UICollectionViewDataSource {
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

extension AlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
