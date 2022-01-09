//
//  AnimeTopPageTableViewCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import UIKit

class AnimeTopPageTableViewCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var animeTitle: UILabel!
    
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? AnimePageCellViewModel else {
            return
        }
        self.animeTitle.text = "elfen lied"
       
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
}
