//
//  AlbumsView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 03.07.2023.
//

import UIKit
import SnapKit

final class AlbumsView: UIViewController {
    var presenter: AlbumsViewOutput?

    // MARK: - Outlets
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(TextCell.self, forCellWithReuseIdentifier: TextCell.identifier)
        collection.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collection.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.configureView()
        setupNavigationView()
        setupView()
        setupHeirarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupNavigationView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        title = "Albums"
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

// MARK: - AlbumsViewInput

extension AlbumsView: AlbumsViewInput {

}
