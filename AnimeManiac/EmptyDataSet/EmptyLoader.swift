//
//  EmptyLoader.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit
import NVActivityIndicatorView

struct EmptyLoader: EmptyReason {
    var completionBlock: (() -> Void)?
    
    
    var verticalOffset: CGFloat {
        return tabBarOffset
    }
    
    var customView: UIView? {
        let view = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),
                                           type: .lineScalePulseOut,
                                           color: .label,
                                           padding: 16)
        view.startAnimating()
        return view
    }
    
    let tabBarOffset: CGFloat
    

    init(tabBarOffset: CGFloat) {
        self.tabBarOffset = tabBarOffset
    }
     
}
