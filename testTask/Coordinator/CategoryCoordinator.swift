//
//  CategoryCoordinator.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//

import UIKit
import SwiftUI

class CategoryCoordinator: CoordinatorProtocol {

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
