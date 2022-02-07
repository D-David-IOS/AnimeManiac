//
//  CustomNavigationController.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

// customed Navigation Controller
class CustomNavigationController: UINavigationController {
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar.prefersLargeTitles = false
        navigationBar.barTintColor = .white
        navigationBar.tintColor = .blue
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
  
}

