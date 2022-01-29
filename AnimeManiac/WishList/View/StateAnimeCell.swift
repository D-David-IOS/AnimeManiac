//
//  StateAnimeCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import UIKit

class StateAnimeCell: UITableViewCell,CellConfigurable {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var numberEpisodes: UILabel!
    @IBOutlet weak var approuvedBy: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
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
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let vm = cellViewModel as? StateAnimeCellViewModel else {
            return
        }
        let newRouting = Routing()
        let animePage = AnimePage(title: vm.stateAnime.title, id: vm.stateAnime.id, image: vm.stateAnime.image, coverImage: vm.stateAnime.coverImage, dateCreation: vm.stateAnime.dateCreation, rate: vm.stateAnime.rate, episodes: vm.stateAnime.episodes, ageRating: vm.stateAnime.ageRating, synopsis: vm.stateAnime.synopsis)
        let route = AnimePageRoutingEntry(animePage: animePage)
        _ = newRouting
            .route(routingEntry: route, fromController: controller, animated: true)
    }
}
