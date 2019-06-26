//
//  BaseTabBarController.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 21/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let schetViewController = SchetHeaderPageController()
        let schetViewController = SchetPageController()
        schetViewController.tabBarItem.title = "Счет"
        schetViewController.tabBarItem.image = UIImage(named: "schet")?.withRenderingMode(.alwaysOriginal)
        
        
        viewControllers = [
            schetViewController,
            createNavController(viewController: UIViewController(), title: "Документы", imageName: "document"),
            createNavController(viewController: UIViewController(), title: "Создать", imageName: "create"),
            createNavController(viewController: UIViewController(), title: "Чат", imageName: "chat"),
            createNavController(viewController: UIViewController(), title: "Еще", imageName: "more")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.badgeColor = .red
        navController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        return navController
        
    }
    
}
