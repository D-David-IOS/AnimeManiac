//
//  Errors.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

enum AnimeError : EmptyError {
    
    case noResultsFound
    case emptyWishList
    case noInternet
    
    var errorAction: ErrorAction {
        switch self {
        case .noResultsFound:
            return .goBack
        case .emptyWishList:
            return .navigate
        case .noInternet:
            return .refresh
        }
    }
    
    var errorTitle: String? {
        switch self {
        case .noResultsFound:
            return "No Results"
        case .emptyWishList:
            return "No animes here"
        case .noInternet:
            return "No internet"
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .noResultsFound:
            return "Sorry we found no result with this search "
        case .emptyWishList:
            return "You can add animes in your wishlist in home"
        case .noInternet:
            return "You have no internet, please try again"
        }
    }
    
    var imageName: String? {
        switch self {
        case .noResultsFound:
            return "search_b"
        case .emptyWishList:
            return "noAnime"
        case .noInternet:
            return "noInternet"
        }
    }
    
    var buttonTitle : String? {
        switch self {
        case .noResultsFound:
            return "Return home"
        case .emptyWishList:
            return "Go to home"
        case .noInternet:
            return "Refresh"
        }
    }
    
}
