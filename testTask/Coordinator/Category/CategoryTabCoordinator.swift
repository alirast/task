//
//  CategoryTabCoordinator.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import Foundation
import UIKit
import SwiftUI

class CategoryTabCoordinator: CoordinatorProtocol {
    var rootViewController: UINavigationController
    
    let viewModel = CategoryViewModel()
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    lazy var firstViewController: CategoryViewController = {
        let vc = CategoryViewController()
        vc.viewModel = viewModel
        vc.showSwiftUI = { [weak self] in
            self?.goToSwiftUIScreen()
        }
        vc.title = "first"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToSwiftUIScreen() {
        let swiftUIScreen = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(swiftUIScreen, animated: true)
    }
}
