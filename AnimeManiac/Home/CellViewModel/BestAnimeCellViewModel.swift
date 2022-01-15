//
//  BestAnimeCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import Foundation

class BestAnimeCellViewModel : TableCellViewModel {
    
    var nibName: String? = "BestAnimeCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var firstHeader: String?
    var secondsubtitle: String?
    var imageProductCell: URL?
    var height: Float = 162
    var estimatedHeight: Float = 162
   
}