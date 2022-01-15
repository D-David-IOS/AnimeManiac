//
//  MyCollectionViewCell.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    func configure() {
        self.myLabel.text = "blabla"
        self.myImage.setImageForUrl(URL(string: "https://media.kitsu.io/anime/poster_images/12/small.jpg"))
    }
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    
}
