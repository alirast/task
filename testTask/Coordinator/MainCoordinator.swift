//
//  CategoryCoordinator.swift
//  testTask
//
//  Created by N S on 29.06.2023.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    var rootViewController: UITabBarController
    var childCoordinators = [CoordinatorProtocol]()
    
    init() {
        self.rootViewController = UITabBarController()
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
        var chosen = ChosenDishCoordinator()
        self.childCoordinators.append(cartCoordinator)
        let cartVC = cartCoordinator.rootViewController
        cartVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "cart"), selectedImage: nil)
        
        let accountCoordinator = AccountCoordinator()
        accountCoordinator.start()
        self.childCoordinators.append(accountCoordinator)
        let accountVC = accountCoordinator.rootViewController
        accountVC.tabBarItem = UITabBarItem(title: "Аккаунт", image: UIImage(named: "account"), selectedImage: nil)
        
        let final = MyVC()
        final.tabBarItem = UITabBarItem(title: "won", image: nil, selectedImage: nil)
        
        self.rootViewController.viewControllers = [categoryVC, searchVC, cartVC, accountVC, final]
        
    }
}

