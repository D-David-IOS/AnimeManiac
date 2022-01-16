//
//  HomeSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class HomeSection: Section {
    
    var animePage : [AnimePage]
        
    init(animePage : [AnimePage]) {
        self.animePage = animePage
        super.init()

        self.cellsVM = [CellViewModel]()
   
        cellsVM.append(HomeCellViewModel())
        cellsVM.append(HorizontalScrollCellViewModel(animePage: animePage))
        cellsVM.append(HorizontalScrollCellViewModel(animePage: animePage))
        cellsVM.append(HorizontalScrollCellViewModel(animePage: animePage))
        cellsVM.append(HorizontalScrollCellViewModel(animePage: animePage))
    }
}
