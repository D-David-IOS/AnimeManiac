//
//  Navigator.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

protocol Navigator {
    var lastRoutingEntry: RoutingEntry? { get set }
    func visibleViewController() -> Controller?
    func visibleViewController(_ rootViewController: Controller?) -> Controller?
    @discardableResult func route(routingEntry: RoutingEntry,
                                  fromController: Controller?,
                                  animated: Bool) -> Navigator
}


enum NavigationStyle {
    // push the new controller
    case push(controller: Controller)
    // present an Alert
    case present(controller: Controller)
    // dismiss the controller
    case dismiss
    // switch index tabBar
    case selectTab(index: Int)
}
