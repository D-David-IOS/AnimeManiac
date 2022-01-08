//
//  RoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

protocol RoutingEntry {
    var navigationStyle: NavigationStyle { get }
    var completionBlock: (() -> Void)? { get set }
}
