//
//  MyCollectionViewCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var animePage : AnimePage?
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    func configure(animePage: AnimePage) {
        self.animePage = animePage
        self.myLabel.text = animePage.title
        self.myImage.setImageForUrl(URL(string: animePage.image))
    }
    
    func cellPressed(animePage: AnimePage, from controller: UIViewController) {
        
        let newRouting = Routing()
        let route = AnimePageRoutingEntry(animePage: animePage)
        _ = newRouting
            .route(routingEntry: route, fromController: controller, animated: true)
    }
    
}
