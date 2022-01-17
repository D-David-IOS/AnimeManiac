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
    @IBOutlet weak var synopsis: UILabel!
    var animePage : AnimePage?
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimePageCellViewModel else {
            return
        }
        self.animePage = cellVM.animePage
        self.myTitle.text = cellVM.animePage.title
        self.myImage.setImageForUrl(URL(string: cellVM.animePage.image))
        self.coverImage.setImageForUrl(URL(string : cellVM.animePage.coverImage))
        self.approuvedBy.text = "Approuved by"+cellVM.animePage.rate
        self.numberEpisodes.text = String(cellVM.animePage.episodes ?? 0)
        self.synopsis.text = cellVM.animePage.synopsis
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    

   
    
}
