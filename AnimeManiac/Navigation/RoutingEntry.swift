//
//  RoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

// used for push, dismiss, present a controller
protocol RoutingEntry {
    // type of navigation
    var navigationStyle: NavigationStyle { get }
    // completionBloked if needed
    var completionBlock: (() -> Void)? { get set }
}
