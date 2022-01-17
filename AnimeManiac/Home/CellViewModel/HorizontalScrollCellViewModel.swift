//
//  BestAnimeCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import Foundation

class HorizontalScrollCellViewModel : TableCellViewModel {
    
    var nibName: String? = "CollectionTableViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var firstHeader: String?
    var secondsubtitle: String?
    var imageProductCell: URL?
    var height: Float = 260
    var estimatedHeight: Float = 260
    var horizontalPage : HoritontalAnimePage
        
    init(horizontalPage : HoritontalAnimePage) {
        self.horizontalPage = horizontalPage
    }
   
}
