//
//  AnimeDescriptionCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

class AnimeDescriptionCellViewModel : TableCellViewModel {
    
    var nibName: String? = "AnimeDescriptionCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var height: Float = 129
    var estimatedHeight: Float = 129
    var animePage : AnimePage
    
    init(animePage : AnimePage) {
        self.animePage = animePage
    }
}
