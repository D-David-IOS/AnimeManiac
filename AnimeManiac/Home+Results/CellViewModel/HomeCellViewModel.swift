//
//  HomeCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class HomeCellViewModel : TableCellViewModel {
    
    var nibName: String? = "HomeCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var height: Float = 350
    var estimatedHeight: Float = 350
    
}
