//
//  AlertRoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 29/01/2022.
//

import Foundation
import UIKit

class AlertRoutingEntry : RoutingEntry {
    
    let message : String
    let title : String
    
    init(message : String, title : String){
        self.message = message
        self.title = title
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        return .present(controller: alertVC)
    }
}
