//
//  CartCoordinator.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//


import UIKit
import SwiftUI

class CartCoordinator: CoordinatorProtocol {

    var rootViewController = UINavigationController()
    
    lazy var cartViewController: UIViewController = {
        var viewController = UIViewController()
        let view = CartView()
        viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([cartViewController], animated: true)
    }
}
