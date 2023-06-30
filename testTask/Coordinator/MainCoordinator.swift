//
//  CategoryCoordinator.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import Foundation
import UIKit


class MainCoordinator: CoordinatorProtocol {
    /*var rootViewController: UITabBarController
    
    
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
    }*/
    
    var rootViewController: UITabBarController
    var childCoordinators = [CoordinatorProtocol]()
    
    init() {
        self.rootViewController = UITabBarController()
        //rootViewController.tabBar.isTranslucent = true
        //make it without blur
        rootViewController.tabBar.backgroundColor = .white
        rootViewController.tabBar.tintColor = UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)
    }
    
    func start() {
        let categoryCoordinator = CategoryCoordinator()
        categoryCoordinator.start()
        self.childCoordinators.append(categoryCoordinator)
        let categoryVC = categoryCoordinator.rootViewController
        categoryVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "category"), selectedImage: nil)
     
        let searchCoordinator = SearchCoordinator()
        searchCoordinator.start()
        self.childCoordinators.append(searchCoordinator)
        let searchVC = searchCoordinator.rootViewController
        searchVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(named: "search"), selectedImage: nil)
        
        let cartCoordinator = CartCoordinator()
        cartCoordinator.start()
        self.childCoordinators.append(cartCoordinator)
        let cartVC = cartCoordinator.rootViewController
        cartVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "cart"), selectedImage: nil)
        
        let accountCoordinator = AccountCoordinator()
        accountCoordinator.start()
        self.childCoordinators.append(accountCoordinator)
        let accountVC = accountCoordinator.rootViewController
        accountVC.tabBarItem = UITabBarItem(title: "Аккаунт", image: UIImage(named: "account"), selectedImage: nil)
        
        self.rootViewController.viewControllers = [categoryVC, searchVC, cartVC, accountVC]
        
    }
}

