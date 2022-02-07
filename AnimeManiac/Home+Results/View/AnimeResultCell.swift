//
//  AnimeResultCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import UIKit

// represent a Result Cell Anime in search
class AnimeResultCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var approuvedBy: UILabel!
    @IBOutlet weak var numberEpisodes: UILabel!
    
    // space between cells in results
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 10
    }
    
    // configure the cell, called in controller
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimeResultCellViewModel else {
            return
        }
        self.myImage.setImageForUrl(URL(string: cellVM.animePage.image))
        self.animeTitle.text = cellVM.animePage.title
        self.createdDate.text = "Created in "+cellVM.animePage.dateCreation
        self.approuvedBy.text = "Approuved by "+cellVM.animePage.rate
        self.numberEpisodes.text = "Episodes : "+String(cellVM.animePage.episodes ?? 0)
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
