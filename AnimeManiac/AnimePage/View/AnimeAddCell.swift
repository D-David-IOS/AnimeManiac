//
//  AnimeAddCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import UIKit

// represent the 2 buttons at bottom in anime page
class AnimeAddCell: UITableViewCell,CellConfigurable {
    
    var animePage : AnimePage?
    @IBOutlet weak var addWishList: UIButton!
    @IBOutlet weak var alreadySeen: UIButton!
    weak var controller : UIViewController?
    
    // configure the cell, called in controller
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimeAddCellViewModel else {
            return
        }
        self.controller = controller
        self.animePage = cellVM.animePage
        let allAnime = StateAnime.getAnimes()
        if (allAnime.firstIndex(where: {$0.id == cellVM.animePage.id }) != nil) {
            self.addWishList.isEnabled = false
            self.alreadySeen.isEnabled = false
        }
    }
    
    // action when cell is pressed
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    
    @IBAction func addWishList(_ sender: Any) {
        guard let anime = self.animePage else {
            return
        }
        
        var allAnime = StateAnime.getAnimes()
        
        let stateAnime = StateAnime(title: anime.title, id: anime.id, image: anime.image, coverImage: anime.coverImage, dateCreation: anime.dateCreation, rate: anime.rate, episodes: anime.episodes, youtubeId: anime.youtubeId ?? "", synopsis: anime.synopsis, alreadySaw: false, inProgress: false)
        allAnime.append(stateAnime)
        StateAnime.saveAnime(stateAnime: allAnime)
        self.addWishList.isEnabled = false
        self.alreadySeen.isEnabled = false
        let route = Routing()
        route.route(routingEntry: AlertRoutingEntry(message: "Anime added in your wishList", title: "Success"), fromController: self.controller, animated: true)
    }
    
  
    @IBAction func addAlreadySeen(_ sender: Any) {
        guard let anime = self.animePage else {
            return
        }
        
        var allAnime = StateAnime.getAnimes()
        
        let stateAnime = StateAnime(title: anime.title, id: anime.id, image: anime.image, coverImage: anime.coverImage, dateCreation: anime.dateCreation, rate: anime.rate, episodes: anime.episodes, youtubeId: anime.youtubeId ?? "", synopsis: anime.synopsis, alreadySaw: true, inProgress: false)
        allAnime.append(stateAnime)
        StateAnime.saveAnime(stateAnime: allAnime)
        self.addWishList.isEnabled = false
        self.alreadySeen.isEnabled = false
        let route = Routing()
        route.route(routingEntry: AlertRoutingEntry(message: "Anime added in your list", title: "Success"), fromController: self.controller, animated: true)
    }
    
}
