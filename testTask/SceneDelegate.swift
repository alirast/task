//
//  SceneDelegate.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    //@State private var isShowingSecondScreen = false

    //var window: UIWindow?
    var applicationCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordinator = AppCoordinator(window: window)
            applicationCoordinator.start()
            //window.rootViewController = UIHostingController(rootView: ContentView())
            //self.window = window
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }
}

