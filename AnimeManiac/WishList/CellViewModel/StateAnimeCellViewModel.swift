//
//  AnimeStateCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

class StateAnimeCellViewModel : TableCellViewModel {
    
    var nibName: String? = "StateAnimeCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var firstHeader: String?
    var secondsubtitle: String?
    var imageProductCell: URL?
    var height: Float = 90
    var estimatedHeight: Float = 90
    var stateAnime : StateAnime
    
    init(stateAnime : StateAnime) {
        self.stateAnime = stateAnime
    }
}
