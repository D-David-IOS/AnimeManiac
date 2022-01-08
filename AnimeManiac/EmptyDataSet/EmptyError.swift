//
//  EmptyError.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

protocol EmptyError : LocalizedError {
    var errorTitle : String? { get }
    var imageName : String?  { get }
    var buttonTitle : String?  { get }
    var errorAction: ErrorAction { get }
}

enum ErrorAction {
    case refresh
    case search
    case navigate(entry: RoutingEntry)
}

extension EmptyError {
    var errorTitle : String? {
        return nil
    }
    
    var imageName: String? {
        return nil
    }
    
    var buttonTitle: String? {
        return nil
    }

}
