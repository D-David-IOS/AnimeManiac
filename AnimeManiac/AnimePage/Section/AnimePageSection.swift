//
//  AnimeFileSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class AnimePageSection: Section {
        
    init(animePage : AnimePage) {
        super.init()

        self.cellsVM = [CellViewModel]()
   
        cellsVM.append(AnimePageCellViewModel(animePage: animePage))
        cellsVM.append(AnimeDescriptionCellViewModel(animePage : animePage))
        // add a youtube video if the ID exist
        if animePage.youtubeId != "" && animePage.youtubeId != nil {
            cellsVM.append(AnimeYoutubeCellViewModel(animePage: animePage))
        }
        cellsVM.append(AnimeAddCellViewModel(animePage: animePage))
    }
}
