//
//  SearchCoordinator.swift
//  testTask
//
//  Created by N S on 30.06.2023.
//

import Foundation
import UIKit
import SwiftUI

class SearchCoordinator: CoordinatorProtocol {
    /*var rootViewController = UIViewController()
    var navigationController: UINavigationController?
    func start() {
        let view = SearchView()
        rootViewController = UIHostingController(rootView: view)
        //navigationController = UINavigationController(rootViewController: rootViewController)
//        navigationController?.isNavigationBarHidden = false
    }*/
    
    
    var rootViewController = UINavigationController()
    lazy var searchViewController: UIViewController = {
        var viewController = UIViewController()
        let view = SearchView()
        viewController = UIHostingController(rootView: view)
        return viewController
    }()
    
    func start() {
        rootViewController.setViewControllers([searchViewController], animated: true)
    }
}
