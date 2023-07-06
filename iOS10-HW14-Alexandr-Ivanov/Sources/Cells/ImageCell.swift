//
//  ImageCell.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 04.07.2023.
//

import UIKit
import SnapKit

class ImageCell: UICollectionViewCell {
    var itemModel: ItemModel? {
        didSet {
            titleLabel.text = itemModel?.title
            countLabel.text = String(itemModel?.filesCount ?? 0)
            imageView.image = itemModel?.image
        }
    }
    static let identifier = "ImageCell"

    // MARK: - Outlets

    private let favorite: UIImageView = {
        let image = UIImage(systemName: "heart.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.text = "Favorites"
        label.textColor = .black
        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.text = "30"
        label.textColor = .systemGray
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
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(countLabel)
        addSubview(imageView)
        imageView.addSubview(favorite)
        addSubview(stack)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
            make.height.equalTo(imageView.snp.width)
        }

        stack.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.trailing.equalTo(self)
        }

        favorite.snp.makeConstraints { make in
            make.leading.bottom.equalTo(imageView).inset(5)
        }
    }

    func showFavorite() {
        favorite.isHidden = false
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        favorite.isHidden = true
        self.itemModel = nil
    }
}
