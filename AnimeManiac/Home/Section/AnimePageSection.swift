//
//  AnimeFileSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class AnimePageSection: CollectionSection {
        
    init(listAnime : ListAnime,category : String) {
        super.init()
        self.position = 0
        self.title = ""
        self.headerVM = HeaderViewModel(category: category)

        self.cellsVM = [CellViewModel]()
   
        cellsVM.append(AnimePageCellViewModel())
    }
}
