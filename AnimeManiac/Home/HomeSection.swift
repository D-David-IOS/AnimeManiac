//
//  HomeSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class HomeSection: CollectionSection {
        
    init(listAnime : ListAnime,category : String) {
        super.init()
        self.position = 0
        self.title = ""
        self.headerVM = HeaderViewModel(category: category)

        self.cellsVM = [CellViewModel]()
   
        
    }
}
