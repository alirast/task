//
//  CartTabCoordinator.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import Foundation
import UIKit

class CartTabCoordinator: CoordinatorProtocol {
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: CartViewController = {
        let vc = CartViewController()
        vc.title = "second"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
