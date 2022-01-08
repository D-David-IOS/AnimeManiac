//
//  BarButtonItem.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import UIKit

class BarButtonItem: UIBarButtonItem {
    
    internal var actionHandler: (() -> Void)?

    convenience init(image : UIImage, actionHandler: (() -> Void)?) {
        self.init(image: image, style: .plain, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }
  
    @objc func barButtonItemPressed(sender: UIBarButtonItem) {
        actionHandler?()
    }
}
