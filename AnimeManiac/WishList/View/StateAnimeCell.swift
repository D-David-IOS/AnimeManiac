//
//  StateAnimeCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import UIKit

// represent an anime cell in wishlist page
class StateAnimeCell: UITableViewCell,CellConfigurable {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var numberEpisodes: UILabel!
    @IBOutlet weak var approuvedBy: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    // configure the cell, called in controller
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? StateAnimeCellViewModel else {
            return
        }
        self.myImage.setImageForUrl(URL(string: cellVM.stateAnime.image))
        self.animeTitle.text = cellVM.stateAnime.title
        self.createdDate.text = cellVM.stateAnime.dateCreation
        self.approuvedBy.text = "Approuved by "+cellVM.stateAnime.rate
        self.numberEpisodes.text = "Episodes : "+String(cellVM.stateAnime.episodes ?? 0)
    }
    
    // action when cell is pressed
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let routingEntry = cellViewModel.routingEntry else {
            return
        }
        let newRouting = Routing()
        _ = newRouting
            .route(routingEntry: routingEntry, fromController: controller, animated: true)
    }
}
