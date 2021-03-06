//
//  SearchCategorySection.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class SearchCategorySection : Section {
    
    // listAnime : AnimePage list
    // category : the category selected like horror, comic etc...
    init(listAnime : [AnimePage], category : String) {
        super.init()
        self.cellsVM = [CellViewModel]()
   
        for anime in listAnime {
            cellsVM.append(AnimeResultCellViewModel(animePage: anime, routingEntry: AnimePageRoutingEntry(animePage: anime)))
        }
        
    }
    
}
