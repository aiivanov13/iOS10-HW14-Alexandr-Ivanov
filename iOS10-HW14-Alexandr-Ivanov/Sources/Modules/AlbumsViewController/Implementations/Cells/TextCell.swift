//
//  TextCell.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 04.07.2023.
//

import UIKit

class TextCell: UICollectionViewCell {
    static let identifier = "TextCell"

    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = .systemGray5.withAlphaComponent(0.9)
            } else {
                backgroundColor = .clear
            }
        }
    }

    var itemModel: ItemModel? {
        didSet {
            titleLabel.text = itemModel?.title
            countLabel.text = String(itemModel?.filesCount ?? 0)
            imageView.image = itemModel?.image
        }
    }

    // MARK: - Outlets

    private let lock: UIImageView = {
        let image = UIImage(systemName: "lock.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
        let imageView = UIImageView(image: image)
        imageView.isHidden = true
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let chevron: UIImageView = {
        let image = UIImage(systemName: "chevron.right")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold, scale: .small))
        let imageView = UIImageView(image: image)
        imageView.tintColor = .systemGray
        imageView.alpha = 0.6
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21, weight: .regular)
        label.textAlignment = .left
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .right
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        addSubview(chevron)
        addSubview(separator)
        addSubview(lock)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self).inset(11)
            make.width.height.equalTo(26)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(imageView.snp.trailing).offset(15)
        }

        chevron.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.trailing.equalTo(self).inset(15)
        }

        countLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.trailing.equalTo(chevron.snp.leading).offset(-8)
        }

        lock.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.trailing.equalTo(chevron.snp.leading).offset(-8)
        }

        separator.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.trailing.bottom.equalTo(self)
            make.leading.equalTo(self).inset(41)
        }
    }

    func hideSeparator() {
        separator.isHidden = true
    }

    func showLock() {
        lock.isHidden = false
        countLabel.isHidden = true
    }

    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        separator.isHidden = false
        lock.isHidden = true
        countLabel.isHidden = false
        itemModel = nil
    }
}
