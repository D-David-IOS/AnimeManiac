//
//  EmptyError.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

// errorTitle : error name
// imageName : name Image in assets
// buttonTitle : title button
// errorAction : Enum for know the action we will do
protocol EmptyError : LocalizedError {
    var errorTitle : String? { get }
    var imageName : String?  { get }
    var buttonTitle : String?  { get }
    var errorAction: ErrorAction { get }
}

// The 3 differents actions while button pressed
enum ErrorAction {
    case refresh
    case goBack
    case navigate
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
