//
//  SceneDelegate.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 19.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        let navBar = UINavigationController(rootViewController: NewTaskViewController())
        window?.rootViewController = navBar
        window?.makeKeyAndVisible()
    }
}

