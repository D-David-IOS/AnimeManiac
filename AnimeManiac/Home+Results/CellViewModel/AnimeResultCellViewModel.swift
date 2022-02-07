//
//  ResultsHomeViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class AnimeResultCellViewModel : TableCellViewModel {
    
    var nibName: String? = "AnimeResultCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var height: Float = 162
    var estimatedHeight: Float = 162
    var animePage : AnimePage
    
    init(animePage : AnimePage, routingEntry : RoutingEntry){
        self.animePage = animePage
        self.routingEntry = routingEntry
    }
    
}
