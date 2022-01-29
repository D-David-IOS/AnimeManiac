//
//  WishListTitleCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import UIKit

class WishListTitleCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let cellVM = cellViewModel as? WishListTitleCellViewModel else {
            return
        }
        self.titleLabel.text = cellVM.title
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
}
