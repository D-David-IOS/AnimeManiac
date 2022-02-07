//
//  ExtensionUIImage.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import UIKit
import SDWebImage

// download an image from url an store it in cache
// use imageplaceholder before display
extension UIImageView {
  
    func setImageForUrl(_ url: URL?) {
        guard let url = url else {
            return
        }
        self.sd_setImage(with: url, placeholderImage: UIImage(named: "search_b.png"))
    }
}

