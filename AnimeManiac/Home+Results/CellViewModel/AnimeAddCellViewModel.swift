//
//  AnimeAddCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

class AnimeAddCellViewModel : TableCellViewModel {
    
    var nibName: String? = "AnimeAddCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var firstHeader: String?
    var secondsubtitle: String?
    var imageProductCell: URL?
    var height: Float = 100
    var estimatedHeight: Float = 100
    var animePage : AnimePage
    
    init(animePage : AnimePage) {
        self.animePage = animePage
    }
}
