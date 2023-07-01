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
        let view = CategoryView {
            self.go()
        }
        viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([firstVC], animated: false)
    }
    
    func go() {
        let search = UIHostingController(rootView: DishesView())
        rootViewController.pushViewController(search, animated: true)
    }
}
