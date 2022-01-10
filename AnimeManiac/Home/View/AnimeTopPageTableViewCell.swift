//
//  AnimeTopPageTableViewCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import UIKit

class AnimeTopPageTableViewCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var myContentView: UIView!
    
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        self.myContentView.layer.cornerRadius = 20
        self.animeTitle.text = "elfen lied"
       
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
}
