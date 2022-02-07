//
//  WishListTitleCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

class WishListTitleCellViewModel : TableCellViewModel {
    
    var nibName: String? = "WishListTitleCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var height: Float = 44
    var estimatedHeight: Float = 44
    var title : String
    
    init(title : String) {
        self.title = title
    }
}
