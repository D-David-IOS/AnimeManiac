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
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    func configure(animePage: AnimePage) {
        self.myLabel.text = animePage.title
        self.myImage.setImageForUrl(URL(string: animePage.image))
    }
    
    func cellPressed(from controller: UIViewController) {
        print("blabla")
    }
    
}
