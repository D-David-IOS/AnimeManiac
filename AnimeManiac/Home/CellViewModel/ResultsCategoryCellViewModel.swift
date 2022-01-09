//
//  ResultsHomeViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class ResultsCategoryCellViewModel : TableCellViewModel {
    
    var nibName: String? = "AnimeTopPageTableViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var firstHeader: String?
    var secondsubtitle: String?
    var imageProductCell: URL?
    var height: Float = 162
    var estimatedHeight: Float = 162
    
}
