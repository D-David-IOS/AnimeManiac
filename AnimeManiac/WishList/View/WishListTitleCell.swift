//
//  WishListTitleCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import UIKit

// represent just the title column
class WishListTitleCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var titleLabel: UILabel!
    
    // configure the cell, called in controller
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? WishListTitleCellViewModel else {
            return
        }
        self.titleLabel.text = cellVM.title
    }
    
    // action when cell is pressed
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
}
