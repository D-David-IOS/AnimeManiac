//
//  coreController.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

class TabBarController: UITabBarController {

    enum Indexes: Int {
        case Home
        case Cart
        case Profile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = TableViewController(viewModel: HomeViewModel())
        let vc2 = TableViewController(viewModel: HomeViewModel())
        
        let nav1 = CustomNavigationController(rootViewController: vc1)
        let nav2 = CustomNavigationController(rootViewController: vc2)
                       
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "wish List", image: UIImage(systemName: "heart"), tag: 2)
        tabBar.tintColor = .green

        setViewControllers([nav1, nav2], animated: false)
    }

}



