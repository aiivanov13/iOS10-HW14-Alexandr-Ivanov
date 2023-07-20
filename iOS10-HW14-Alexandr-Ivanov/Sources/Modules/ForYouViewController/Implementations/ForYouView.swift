//
//  ForYouView.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 06.07.2023.
//

import UIKit

class ForYouView: UIViewController {
    var presenter: ForYouViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}

// MARK: - ForYouViewInput

extension ForYouView: ForYouViewInput {

}
