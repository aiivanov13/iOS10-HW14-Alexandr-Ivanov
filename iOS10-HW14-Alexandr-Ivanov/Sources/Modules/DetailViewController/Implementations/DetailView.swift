//
//  DetailView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 19.07.2023.
//

import UIKit

class DetailView: UIViewController {
    var presenter: DetailViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
    }
}

// MARK: - DetailViewInput

extension DetailView: DetailViewInput {

}
