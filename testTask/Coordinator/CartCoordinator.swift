//
//  CartCoordinator.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//


import UIKit
import SwiftUI
import Combine

class CartCoordinator: CoordinatorProtocol, ObservableObject {
    
    var itemy: String = ""

    var rootViewController = UINavigationController()
    
    lazy var cartViewController: UIViewController = {
        var viewController = UIViewController()
        var view = CartView(coord: self)
        view.getItem(itemy)
        viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([cartViewController], animated: true)

    }
    
    func getName(_ name: String) {
        self.itemy = name
        var view = CartView(coord: self)
        view.getItem(self.itemy)
    
    }
}
