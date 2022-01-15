//
//  HomeSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class HomeSection: Section {
        
    override init() {
        super.init()

        self.cellsVM = [CellViewModel]()
   
        cellsVM.append(HomeCellViewModel())
        cellsVM.append(BestAnimeCellViewModel())
    }
}
