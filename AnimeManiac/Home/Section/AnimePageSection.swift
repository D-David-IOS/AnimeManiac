//
//  AnimeFileSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class AnimePageSection: Section {
        
    init(listAnime : ListAnime,category : String) {
        super.init()

        self.cellsVM = [CellViewModel]()
   
        cellsVM.append(AnimeTopPageCellViewModel())
    }
}