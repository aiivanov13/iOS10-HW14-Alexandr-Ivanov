//
//  SceneDelegate.swift
//  iOS10-HW14-Alexandr-Ivanov
//
//  Created by Александр Иванов on 03.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TabBarModule().makeModule()
        window?.makeKeyAndVisible()
    }
}
