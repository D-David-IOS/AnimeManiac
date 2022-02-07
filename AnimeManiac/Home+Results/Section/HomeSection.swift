//
//  HomeSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class HomeSection: Section {
    
    // list of carousels in Home
    var horizontalPages : [HoritontalAnimePage]
        
    init(horizontalPages : [HoritontalAnimePage]) {
        self.horizontalPages = horizontalPages
        super.init()

        self.cellsVM = [CellViewModel]()
   
        cellsVM.append(HomeCellViewModel())
        for horizontalPage in horizontalPages {
            self.cellsVM.append(HorizontalScrollCellViewModel(horizontalPage: horizontalPage))
        }
    }
}
