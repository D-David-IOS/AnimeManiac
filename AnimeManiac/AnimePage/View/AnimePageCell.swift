//
//  AnimePageCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 16/01/2022.
//

import UIKit

class AnimePageCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var approuvedBy: UILabel!
    @IBOutlet weak var numberEpisodes: UILabel!
    var animePage : AnimePage?
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimePageCellViewModel else {
            return
        }
        self.animePage = cellVM.animePage
        self.myTitle.text = cellVM.animePage.title + " (\(cellVM.animePage.dateCreation))"
        self.myImage.setImageForUrl(URL(string: cellVM.animePage.image))
        self.coverImage.setImageForUrl(URL(string : cellVM.animePage.coverImage))
        self.approuvedBy.text = "Approuved by "+cellVM.animePage.rate
        self.numberEpisodes.text = "Episodes : "+String(cellVM.animePage.episodes ?? 0)
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    

   
    
}
