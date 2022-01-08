//
//  AnyBarButtonItem.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import UIKit

enum AnyBarButtonItem {
    case share(url: URL, urlImage: URL)
    case search
    
    func image() -> UIImage {
        switch self {
        case .share:
            return UIImage(systemName: "square.and.arrow.up")!
        case .search:
            return UIImage(systemName: "magnifyingglass")!
        }
    }
}
