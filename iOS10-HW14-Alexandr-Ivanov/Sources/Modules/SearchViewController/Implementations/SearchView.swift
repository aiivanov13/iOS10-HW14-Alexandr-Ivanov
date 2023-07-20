//
//  SearchView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

class SearchView: UIViewController {
    var presenter: SearchViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
}

// MARK: - SearchViewInput

extension SearchView: SearchViewInput {

}
