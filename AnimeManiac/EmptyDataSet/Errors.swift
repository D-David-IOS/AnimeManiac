//
//  Errors.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

enum SearchError : EmptyError {
    var errorAction: ErrorAction {
        return .search
    }
    
    case noResultsFound
    
    var errorTitle: String? {
        switch self {
        case .noResultsFound:
            return NSLocalizedString("noResults", comment: "no result")
        }
    }
    
    var errorDescription: String? {
        return NSLocalizedString("noResultsWithThisSearch", comment: "no results with this search")
    }
    
    var imageName: String? {
        return "noResult"
    }
    
    var buttonTitle : String? {
        return NSLocalizedString("returnHome", comment : "return home")
    }
    
}

enum AnimeError: EmptyError {
    
    case  badURL
    case  noProductFetch
    case  wrongCollections
    
    var errorTitle : String? {
        switch self {
        case .badURL:
            return NSLocalizedString("badurl", comment: "bad url")
        case .noProductFetch:
            return NSLocalizedString("failTofecthProduct", comment: "failed to download product")
        case .wrongCollections:
            return NSLocalizedString("failTofetchCollection", comment: "failed to download home")
        }
    }
    
    var errorDescription: String? {
        return NSLocalizedString("internet", comment: "no internet")
    }
    
    var imageName : String? {
        return "noInternet"
    }
    
    var buttonTitle : String? {
        return NSLocalizedString("retry", comment : "Retry")
    }
    
    var errorAction: ErrorAction {
        switch self {
        default:
            return .refresh
        }
    }
}
