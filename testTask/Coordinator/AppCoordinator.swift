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
    
    //let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //for setup from sample views
        //window.rootViewController = UIHostingController(rootView: ContentView())
        /*let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController*/
        
        
        //for setup from category view
        /*let categoryCoordinator = CategoryCoordinator()
        categoryCoordinator.start()
        self.childCoordinators = [categoryCoordinator]
        window.rootViewController = categoryCoordinator.rootViewController*/
        
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        self.childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
    

}
