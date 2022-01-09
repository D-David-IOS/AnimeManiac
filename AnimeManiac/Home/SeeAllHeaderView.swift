//
//  SeeAllHeaderView.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

class SeeAllHeaderView: UICollectionReusableView, CellConfigurable {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    var category : String = ""
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let headerVM = cellViewModel as? HeaderViewModel else {
            return
        }
        self.category = headerVM.category
        self.label.text = headerVM.category
        self.button.setTitle("SeeAll", for: .normal)
    }
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }

    @IBAction func seeAllButton(_ sender: Any) {
       
        let newRouting = Routing()
        
        _ = newRouting
            .route(routingEntry: SeeAllRoutingEntry(category : self.category),
                   fromController: nil,
                   animated: true)
    }
    
}
