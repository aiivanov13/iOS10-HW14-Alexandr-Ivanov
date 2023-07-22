//
//  AlbumsProtocols.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import UIKit

// Presenter -> View
protocol AlbumsViewInput: AnyObject {

}

// View -> Presenter
protocol AlbumsViewOutput: AnyObject {
    func configureView()
    func pullSectionCount() -> Int
    func pullItemsCount(section: Int) -> Int
    func pullItem(section: Int, row: Int) -> ItemModel
    func pullLastItem(section: Int) -> ItemModel
    func pullSectionTitle(section: Int) -> String
    func pullSectionButtonIsHidden(section: Int) -> Bool
    func itemTapped(section: Int, row: Int)
}

// Presenter -> Interactor
protocol AlbumsInteractorInput: AnyObject {
    func loadData()
    func getSectionCount() -> Int
    func getItemsCount(section: Int) -> Int
    func getItem(section: Int, row: Int) -> ItemModel
    func getLastItem(section: Int) -> ItemModel
    func getSectionTitle(section: Int) -> String
    func getSectionButtonIsHidden(section: Int) -> Bool
}

// Interactor -> Presenter
protocol AlbumsInteractorOutput: AnyObject {

}

// Presenter -> Router
protocol AlbumsRouterInput: AnyObject {
    func pushDetailView(with image: UIImage)
}
