//
//  CategoryCoordinator.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//

import Foundation
import UIKit
import SwiftUI

class CategoryCoordinator: CoordinatorProtocol {
    
    /*var rootViewController = UIViewController()
    
    var childCoordinators = [CoordinatorProtocol]()
    
    func start() {
        let view = CategoryView(coordinator: self) {
            self.roundedRectTapped()
        }
        
        rootViewController = UIHostingController(rootView: view)
    }
    
    func roundedRectTapped() {
        let searchCoordinator = SearchCoordinator()
        searchCoordinator.start()
        childCoordinators.append(searchCoordinator)
        rootViewController.present(searchCoordinator.rootViewController, animated: true)
        
    }*/
    
    
    var rootViewController: UINavigationController
    init() {
        rootViewController = UINavigationController()
     
    }
    
    lazy var firstVC: UIViewController = {
        var viewController = UIViewController()
        let view = CategoryView { name in
            self.go(name)
            print("hello from category coordinator with \(name)")
        }
        viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([firstVC], animated: false)

    }
    
    func go(_ withName: String) {
        let search = UIHostingController(rootView: DishesView(name: withName))
        print("hello from go function with name \(withName)")
        rootViewController.pushViewController(search, animated: true)
    }
}
