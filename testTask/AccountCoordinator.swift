//
//  AccountCoordinator.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//

import Foundation
import UIKit
import SwiftUI

class AccountCoordinator: CoordinatorProtocol {
    var rootViewController = UINavigationController()
    
    lazy var accountViewController: UIViewController = {
        var viewController = UIViewController()
        let view = AccountView()
        viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([accountViewController], animated: true)
    }
}
