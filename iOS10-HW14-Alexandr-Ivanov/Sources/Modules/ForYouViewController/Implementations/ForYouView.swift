//
//  ForYouView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

final class ForYouView: UIViewController {
    var presenter: ForYouViewOutput?

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
        title = "For You"
    }

    private func setupView() {
        view.backgroundColor = .systemPink
    }
}

// MARK: - ForYouViewInput

extension ForYouView: ForYouViewInput {

}
