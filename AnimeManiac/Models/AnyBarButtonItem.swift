//
//  AnyBarButtonItem.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import UIKit

enum AnyBarButtonItem {
    case search
    
    func image() -> UIImage {
        switch self {
        case .search:
            return UIImage(systemName: "magnifyingglass")!
        }
    }
}
