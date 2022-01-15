//
//  SearchCategorySection.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class SearchCategorySection : Section {
    
    init(listAnime : [AnimePage], category : String) {
        super.init()
        self.cellsVM = [CellViewModel]()
   
        for anime in listAnime {
            cellsVM.append(AnimeResultCellViewModel(animePage: anime))
        }
        
    }
    
}
