//
//  ImageCell.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 04.07.2023.
//

import UIKit
import SnapKit

class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"

    override var isSelected: Bool {
        didSet {
            if isSelected {
                UIView.animate(withDuration: 0.2) {
                    self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                    self.selectionView.backgroundColor = .systemGray5.withAlphaComponent(0.9)
                }
            } else {
                transform = CGAffineTransform.identity
                selectionView.backgroundColor = .clear
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

    private let selectionView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.backgroundColor = .clear
        return view
    }()

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
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.textColor = UIColor.init { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
        }

        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupView() {
        layer.cornerRadius = 5
    }

    private func setupHierarchy() {
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(countLabel)
        addSubview(imageView)
        imageView.addSubview(favorite)
        imageView.addSubview(selectionView)
        addSubview(stack)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
            make.height.equalTo(imageView.snp.width)
        }

        selectionView.snp.makeConstraints { $0.leading.trailing.top.bottom.equalTo(imageView) }

        stack.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(6)
            make.leading.trailing.equalTo(self)
        }

        favorite.snp.makeConstraints { $0.leading.bottom.equalTo(imageView).inset(5) }
    }

    func showFavorite() {
        favorite.isHidden = false
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        favorite.isHidden = true
        itemModel = nil
    }
}
