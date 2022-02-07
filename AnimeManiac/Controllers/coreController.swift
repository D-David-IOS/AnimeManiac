//
//  coreController.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

class TabBarController: UITabBarController {

    // home : index = 0
    // wishlist : index = 1
    enum Indexes: Int {
        case Home
        case WishList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // tab Home
        let vc1 = TableViewController(viewModel: HomeViewModel(apiService: AnimeRequest()))
        // tab WishList
        let vc2 = TableViewController(viewModel: WishListViewModel())
        
        // use CustomeNavigationController
        let nav1 = CustomNavigationController(rootViewController: vc1)
        let nav2 = CustomNavigationController(rootViewController: vc2)
        
        // tabs Icons
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "wish List", image: UIImage(systemName: "heart"), tag: 2)
        tabBar.tintColor = .green

        setViewControllers([nav1, nav2], animated: false)
    }

}



