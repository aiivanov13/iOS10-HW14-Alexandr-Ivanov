//
//  Model.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 04.07.2023.
//

import UIKit

struct ItemModel {
    var image: UIImage?
    var title: String
    var filesCount: Int
}

struct SectionModel {
    var title: String
    var buttonIsHiden: Bool = true
    var item: [ItemModel]
}

extension SectionModel {
    static var sectionModels: [SectionModel] = [
        SectionModel(title: "My Albums", buttonIsHiden: false, item: [
            ItemModel(image: UIImage(named: "image1"), title: "Recents", filesCount: 756),
            ItemModel(image: UIImage(named: "image2"), title: "Favorites", filesCount: 23),
            ItemModel(image: UIImage(named: "image3"), title: "Family Reunion", filesCount: 55),
            ItemModel(image: UIImage(named: "image4"), title: "Instagram", filesCount: 63),
            ItemModel(image: UIImage(named: "image5"), title: "WhatsApp", filesCount: 36),
            ItemModel(image: UIImage(named: "image6"),title: "Pinterest", filesCount: 6),
            ItemModel(image: UIImage(named: "image7"), title: "Twitter", filesCount: 86),
            ItemModel(image: UIImage(named: "image8"), title: "InShot", filesCount: 12)
        ]),
        SectionModel(title: "Shared Albums", item: [
            ItemModel(image: UIImage(named: "image9"), title: "Family", filesCount: 235),
            ItemModel(image: UIImage(named: "image10"), title: "Wedding", filesCount: 34),
            ItemModel(image: UIImage(named: "image11"), title: "Holidays", filesCount: 61),
            ItemModel(image: UIImage(named: "image12"), title: "Vacation", filesCount: 15)
        ]),
        SectionModel(title: "Media types", item: [
            ItemModel(title: "Videos", filesCount: 210),
            ItemModel(title: "Selfies", filesCount: 122),
            ItemModel(title: "Live Photos", filesCount: 100),
            ItemModel(title: "Time-lapse", filesCount: 4),
            ItemModel(title: "Bursts", filesCount: 12),
            ItemModel(title: "Screenshots", filesCount: 42),
            ItemModel(title: "Screen Recordings", filesCount: 5)
        ]),
        SectionModel(title: "Utilities", item: [
            ItemModel(title: "Imports", filesCount: 185),
            ItemModel(title: "Duplicates", filesCount: 2),
            ItemModel(title: "Hidden", filesCount: 0),
            ItemModel(title: "Recently Deleted", filesCount: 0)
        ])
    ]
}
