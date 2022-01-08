//
//  UIViewController+Controller.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

extension UIViewController: Controller {

    var presentedController: Controller? {
        return self.presentedViewController
    }
    
    var navController: NavController? {
        return self.navigationController
    }
    
    func present(controller: Controller, animated: Bool, completion: @escaping () -> ()) {
        guard let viewController = controller as? UIViewController else {
            return
        }
        self.present(viewController,
                     animated: animated,
                     completion: completion)
    }
        
}
