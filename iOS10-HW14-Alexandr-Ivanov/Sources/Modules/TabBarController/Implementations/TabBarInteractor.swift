//
//  TabBarInteractor.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 20.07.2023.
//

import Foundation

final class TabBarInteractor {
    weak var presenter: TabBarInteractorOutput?

    required init(presenter: TabBarInteractorOutput) {
        self.presenter = presenter
    }
}

// MARK: - TabBarInteractorInput

extension TabBarInteractor: TabBarInteractorInput {

}
