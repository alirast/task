//
//  AppCoordinator.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class AppCoordinator: CoordinatorProtocol {
    let window: UIWindow
    
    var childCoordinators = [CoordinatorProtocol]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //window.rootViewController = UIHostingController(rootView: ContentView())
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
        
    }
    

}
