//
//  SearchView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

final class SearchView: UIViewController {
    var presenter: SearchViewOutput?

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
        title = "Search"
    }

    private func setupView() {
        view.backgroundColor = .systemCyan
    }
}

// MARK: - SearchViewInput

extension SearchView: SearchViewInput {

}
