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
    case push(controller: Controller)
    case pop
    case present(controller: Controller)
    case dismiss
    case url(appURL: URL, webURL: URL)
    case selectTab(index: Int)
}
