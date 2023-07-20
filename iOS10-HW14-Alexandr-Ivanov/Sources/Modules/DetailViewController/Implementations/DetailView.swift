//
//  DetailView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 19.07.2023.
//

import UIKit

class DetailView: UIViewController {
    var presenter: DetailViewOutput?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.backgroundColor = .red
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
        //button.addTarget(self, action: #selector(backButtonTapped()), for: <#T##UIControl.Event#>)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
            make.height.equalTo(imageView.snp.width)
        }

        backButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.leading.trailing.equalTo(view).inset(130)
        }
    }
}

// MARK: - DetailViewInput

extension DetailView: DetailViewInput {

}
