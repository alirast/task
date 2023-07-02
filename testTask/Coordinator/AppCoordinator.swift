//
//  AppCoordinator.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import SwiftUI

class AppCoordinator: CoordinatorProtocol {
    let window: UIWindow
    
    var childCoordinators = [CoordinatorProtocol]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }

}
