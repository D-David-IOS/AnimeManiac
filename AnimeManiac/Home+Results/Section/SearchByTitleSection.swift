//
//  SearchByTitleSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import Foundation

class SearchByTitleSection : Section {
    
    // listAnime : AnimePage list
    // search : text search
    init(listAnime : [AnimePage], search : String) {
        super.init()
        self.cellsVM = [CellViewModel]()
   
        for anime in listAnime {
            cellsVM.append(AnimeResultCellViewModel(animePage: anime, routingEntry: AnimePageRoutingEntry(animePage: anime)))
        }
        
    }
    
}
