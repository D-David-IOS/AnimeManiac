//
//  UINavigationController+NavController.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

extension UINavigationController: NavController {
    
    func push(controller: Controller, animated: Bool) {
        guard let viewController = controller as? UIViewController else {
            return
        }
        self.pushViewController(viewController,
                                animated: animated)
    }
     
}
