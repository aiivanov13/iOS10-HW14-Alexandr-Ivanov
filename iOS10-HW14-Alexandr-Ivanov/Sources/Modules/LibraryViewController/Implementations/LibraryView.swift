//
//  LibraryView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

class LibraryView: UIViewController {
    var presenter: LibraryViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
    }
}

// MARK: - LibraryViewInput

extension LibraryView: LibraryViewInput {

}
