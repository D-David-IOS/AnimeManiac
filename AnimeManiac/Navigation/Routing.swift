//
//  Routing.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import UIKit

class Routing: NSObject, Navigator {
    
    // MARK: - Navigator
    
    var lastRoutingEntry: RoutingEntry?
    
    func visibleViewController() -> Controller? {
        guard let window = UIApplication.shared.delegate?.window  else {
            return nil
        }
        return self.visibleViewController(window!.rootViewController)
    }
    
    func visibleViewController(_ rootViewController: Controller?) -> Controller? {
        
        if let rootNavigationController = rootViewController as? UINavigationController {
            let lastViewController: UIViewController? = rootNavigationController.viewControllers.last
            return self.visibleViewController(lastViewController)
        } else if let rootTabBarController = rootViewController as? UITabBarController {
            let selectedViewController: UIViewController? = rootTabBarController.selectedViewController
            return visibleViewController(selectedViewController)
        }
        
        if rootViewController?.presentedController == nil {
            return rootViewController
        } else {
            return self.visibleViewController(rootViewController?.presentedController)
        }
    }
    
    @discardableResult func route(routingEntry: RoutingEntry,
                                  fromController: Controller? = nil,
                                  animated: Bool = true) -> Navigator {
        var fromVC = fromController
        
        if fromVC == nil {
            fromVC = self.visibleViewController()
        }
        
        // Navigate on main thread to avoid crashes
        DispatchQueue.main.async(execute: {() -> Void in
            switch routingEntry.navigationStyle {
            case .push(let viewControllerToDisplay):
                
                var fromNavigationController: UINavigationController? = fromController as? UINavigationController
                
                if let navigationController = fromVC?.navController as? UINavigationController {
                    fromNavigationController = navigationController
                }
                
                fromNavigationController?.pushViewController(viewControllerToDisplay as! UIViewController, animated: animated)
                
                break
                
            case .present(let viewControllerToDisplay):
                fromVC?.present(controller: viewControllerToDisplay,
                                animated: animated,
                                completion: {() -> Void in
                    routingEntry.completionBlock?()
                })
                
                break
            case .selectTab(let index) :
                guard let navigationController = fromVC as? UINavigationController ?? fromVC?.navController as? UINavigationController,
                      let tabBarController = navigationController.tabBarController else {
                          return
                      }
                                                    
                tabBarController.selectedIndex = index
                routingEntry.completionBlock?()
                
                break
            }
            
        })
        
        self.lastRoutingEntry = routingEntry
        return self
    }
}
