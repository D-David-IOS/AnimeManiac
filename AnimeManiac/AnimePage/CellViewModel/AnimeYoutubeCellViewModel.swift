//
//  AnimeYoutubeCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 29/01/2022.
//

import Foundation

class AnimeYoutubeCellViewModel : TableCellViewModel {
    
    var nibName: String? = "AnimeYoutubeCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var height: Float = 200
    var estimatedHeight: Float = 200
    var animePage : AnimePage
    
    init(animePage : AnimePage) {
        self.animePage = animePage
    }
}
