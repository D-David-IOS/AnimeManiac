//
//  WishListSection.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

class WishListSection: Section {
        
    init(listAnimes : [StateAnime]) {
        super.init()

        self.cellsVM = [CellViewModel]()
        
        var wish = [StateAnime]()
        var inProgress = [StateAnime]()
        var alreadySeen = [StateAnime]()
        
        for anime in listAnimes {
            if anime.alreadySaw {
                alreadySeen.append(anime)
            } else if anime.inProgress {
                inProgress.append(anime)
            } else {
                wish.append(anime)
            }
        }
        
        self.cellsVM.append(WishListTitleCellViewModel(title: "To watch : "))
        for anime in wish {
            self.cellsVM.append(StateAnimeCellViewModel(stateAnime: anime))
        }
        self.cellsVM.append(WishListTitleCellViewModel(title: "In progress : "))
        for anime in inProgress {
            self.cellsVM.append(StateAnimeCellViewModel(stateAnime: anime))
        }
        self.cellsVM.append(WishListTitleCellViewModel(title: "Already seen : "))
        for anime in alreadySeen {
            self.cellsVM.append(StateAnimeCellViewModel(stateAnime: anime))
        }
    }
}
