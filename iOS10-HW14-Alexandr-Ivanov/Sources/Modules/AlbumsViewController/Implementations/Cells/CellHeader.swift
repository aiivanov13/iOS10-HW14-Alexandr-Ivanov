//
//  CellHeader.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 04.07.2023.
//

import UIKit

class CellHeader: UICollectionReusableView {
    static let identifier = "CellHeader"

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var buttonIsHidden: Bool? {
        didSet {
            button.isHidden = buttonIsHidden ?? true
        }
    }

    // MARK: - Outlets

    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(separator)
        addSubview(titleLabel)
        addSubview(button)
    }

    private func setupLayout() {
        separator.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.leading.equalTo(self).inset(10)
            make.trailing.top.equalTo(self)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(10)
            make.centerY.equalTo(self)
        }

        button.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(20)
            make.centerY.equalTo(self)
        }
    }
}
