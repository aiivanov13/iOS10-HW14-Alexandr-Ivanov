//
//  Entity.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 18.07.2023.
//

import UIKit

struct ItemModel: Equatable {
    var image: UIImage?
    var title: String
    var filesCount: Int
}

struct SectionModel {
    var title: String
    var buttonIsHidden: Bool?
    var items: [ItemModel]
}

extension SectionModel {
    static var sectionModels: [SectionModel] = [
        SectionModel(
            title: "My Albums",
            buttonIsHidden: false,
            items: [
                ItemModel(image: UIImage(named: "image1"), title: "Recents", filesCount: 756),
                ItemModel(image: UIImage(named: "image2"), title: "Favorites", filesCount: 23),
                ItemModel(image: UIImage(named: "image3"), title: "Family Reunion", filesCount: 55),
                ItemModel(image: UIImage(named: "image4"), title: "Instagram", filesCount: 63),
                ItemModel(image: UIImage(named: "image5"), title: "WhatsApp", filesCount: 36),
                ItemModel(image: UIImage(named: "image6"),title: "Pinterest", filesCount: 6),
                ItemModel(image: UIImage(named: "image7"), title: "Twitter", filesCount: 86),
                ItemModel(image: UIImage(named: "image8"), title: "InShot", filesCount: 12)
            ]
        ),
        SectionModel(
            title: "Shared Albums",
            items: [
                ItemModel(image: UIImage(named: "image9"), title: "Family", filesCount: 235),
                ItemModel(image: UIImage(named: "image10"), title: "Wedding", filesCount: 34),
                ItemModel(image: UIImage(named: "image11"), title: "Holidays", filesCount: 61),
                ItemModel(image: UIImage(named: "image12"), title: "Vacation", filesCount: 15)
            ]
        ),
        SectionModel(
            title: "Media types",
            items: [
                ItemModel(image: UIImage(systemName: "video"), title: "Videos", filesCount: 210),
                ItemModel(image: UIImage(systemName: "person.crop.square"), title: "Selfies", filesCount: 122),
                ItemModel(image: UIImage(systemName: "livephoto"), title: "Live Photos", filesCount: 100),
                ItemModel(image: UIImage(systemName: "timelapse"), title: "Time-lapse", filesCount: 4),
                ItemModel(image: UIImage(systemName: "square.stack.3d.down.right"), title: "Bursts", filesCount: 12),
                ItemModel(image: UIImage(systemName: "camera.viewfinder"), title: "Screenshots", filesCount: 42),
                ItemModel(image: UIImage(systemName: "record.circle"), title: "Screen Recordings", filesCount: 5)
            ]
        ),
        SectionModel(
            title: "Utilities",
            items: [
                ItemModel(image: UIImage(systemName: "square.and.arrow.down"), title: "Imports", filesCount: 185),
                ItemModel(image: UIImage(systemName: "square.on.square"), title: "Duplicates", filesCount: 2),
                ItemModel(image: UIImage(systemName: "eye.slash"), title: "Hidden", filesCount: 0),
                ItemModel(image: UIImage(systemName: "trash"), title: "Recently Deleted", filesCount: 0)
            ]
        )
    ]
}
