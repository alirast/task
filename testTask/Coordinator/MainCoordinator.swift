//
//  CategoryCoordinator.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorProtocol {
    var rootViewController: UITabBarController
    
    
    var childCoordinators = [CoordinatorProtocol]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }
    
    func start() {
        let firstCoordinator = CategoryTabCoordinator()
        firstCoordinator.start()
        self.childCoordinators.append(firstCoordinator)
        let firstVC = firstCoordinator.rootViewController
        //for system image is UIImage(systemImage:)
        //here can be setup function called
        firstVC.tabBarItem = UITabBarItem(title: "uitabfirst", image: nil, selectedImage: nil)
        
        let secondCoordinator = CartTabCoordinator()
        secondCoordinator.start()
        self.childCoordinators.append(secondCoordinator)
        let secondVC = secondCoordinator.rootViewController
        secondVC.tabBarItem = UITabBarItem(title: "uitabsec", image: nil, selectedImage: nil)
        
        self.rootViewController.viewControllers = [firstVC, secondVC]
    }
    
    func setup(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
