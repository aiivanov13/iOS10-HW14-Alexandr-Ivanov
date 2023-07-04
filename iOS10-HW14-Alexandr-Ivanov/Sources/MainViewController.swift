//
//  MainViewController.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 03.07.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    // MARK: - Outlets

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
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

    }

    private func setupLayout() {

    }
}
