//
//  HeaderViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class HeaderViewModel: CellViewModel {
    
    var routingEntry: RoutingEntry?
    var indexPath: IndexPath?
    var nibName: String? = String(describing: SeeAllHeaderView.self)
    lazy var reuseIdentifier: String = String(describing: self)
    
    var category : String
    
    init(category: String) {
        self.category = category
    }
    
}
