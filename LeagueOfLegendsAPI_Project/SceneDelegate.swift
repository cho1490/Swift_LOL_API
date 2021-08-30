//
//  SceneDelegate.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController()
        let coordinator = AppDependency.reslove().mainCoordinator
        coordinator.navigationController = navigationController
        coordinator.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

