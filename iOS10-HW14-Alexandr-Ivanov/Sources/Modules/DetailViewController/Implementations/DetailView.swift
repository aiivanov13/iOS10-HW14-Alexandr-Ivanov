//
//  DetailView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 19.07.2023.
//

import UIKit

final class DetailView: UIViewController {
    var presenter: DetailViewOutput?

    // MARK: - Outlets

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var backButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.tintColor = .white
        button.backgroundColor = .systemGray2
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
        navigationController?.isNavigationBarHidden = true
    }

    private func setupView() {
        presenter?.pullImage()
        view.backgroundColor = .white
    }

    private func setupHeirarchy() {
        view.addSubview(imageView)
        view.addSubview(backButton)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.leading.trailing.equalTo(view).inset(90)
            make.height.equalTo(imageView.snp.width).multipliedBy(2)
        }

        backButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp_bottomMargin).inset(30)
            make.height.equalTo(40)
            make.leading.trailing.equalTo(view).inset(130)
        }
    }

    // MARK: - Action

    @objc func backButtonTapped() {
        presenter?.backButtonTapped()
    }
}

// MARK: - DetailViewInput

extension DetailView: DetailViewInput {
    func setImage(with image: UIImage) {
        imageView.image = image
    }
}
