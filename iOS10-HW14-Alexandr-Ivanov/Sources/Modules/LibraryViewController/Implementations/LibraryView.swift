//
//  LibraryView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

final class LibraryView: UIViewController {
    var presenter: LibraryViewOutput?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        setupView()
    }

    // MARK: - Setup

    private func setupNavigationView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        title = "Library"
    }

    private func setupView() {
        view.backgroundColor = .systemBrown
    }
}

// MARK: - LibraryViewInput

extension LibraryView: LibraryViewInput {

}
