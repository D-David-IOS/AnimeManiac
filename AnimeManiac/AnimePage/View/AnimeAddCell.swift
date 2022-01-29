//
//  AnimeAddCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import UIKit

class AnimeAddCell: UITableViewCell,CellConfigurable {
    
    var animePage : AnimePage?
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimeAddCellViewModel else {
            return
        }
        self.animePage = cellVM.animePage
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    
    @IBAction func addWishList(_ sender: Any) {
        guard let anime = self.animePage else {
            return
        }
        
        let stateAnime = StateAnime(title: anime.title, id: anime.id, image: anime.image, coverImage: anime.coverImage, dateCreation: anime.dateCreation, rate: anime.rate, episodes: anime.episodes, ageRating: anime.ageRating, synopsis: anime.synopsis, alreadySaw: false, inProgress: false)
        StateAnime.saveAnime(stateAnime: [stateAnime])
    }
    
  
    @IBAction func addAlreadySeen(_ sender: Any) {
        guard let anime = self.animePage else {
            return
        }
        
        let stateAnime = StateAnime(title: anime.title, id: anime.id, image: anime.image, coverImage: anime.coverImage, dateCreation: anime.dateCreation, rate: anime.rate, episodes: anime.episodes, ageRating: anime.ageRating, synopsis: anime.synopsis, alreadySaw: true, inProgress: false)
        StateAnime.saveAnime(stateAnime: [stateAnime])
    }
    
}
