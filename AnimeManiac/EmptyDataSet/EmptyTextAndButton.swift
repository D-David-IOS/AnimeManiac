//
//  EmptyTextAndButton.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import UIKit

struct EmptyTextAndButton: EmptyReason {
    
    // Vertical Offset
    var verticalOffset: CGFloat {
        return tabBarOffset
    }
    
    let tabBarOffset: CGFloat
    
    // Title
    let customTitle: String
    
    var attributedTitle: NSAttributedString? {
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : UIColor.label];
        return NSAttributedString(string: self.customTitle,
                                  attributes: attributedStringColor)
    }
    
    // Description
    var customDescription : String
    
    var attributedDescription : NSAttributedString? {
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : UIColor.label];
        return NSAttributedString(string: self.customDescription,
                                  attributes: attributedStringColor)
    }
    
    
    let image: UIImage?
    
    var attributedButtonTitle: NSAttributedString? {
        var attributes: [NSAttributedString.Key: Any] = [:]
        let font = UIFont.boldSystemFont(ofSize: 17)
        let textColor = UIColor(ciColor: .white)
        
        attributes[NSAttributedString.Key.font] = font
        attributes[NSAttributedString.Key.foregroundColor] = textColor
        
        return NSAttributedString(string: self.buttonTitle,
                                  attributes: attributes)
    }
    
    var buttonBackgroundImage: UIImage? {
        let image = UIImage(named: "goldButton")
        return image!
    }
    
    var completionBlock: (() -> Void)?
    
    let buttonTitle: String
    
    init(tabBarOffset: CGFloat,
         customTitle: String,
         customDescription : String,
         image : UIImage,
         buttonTitle : String,
         completionBlock : (() -> Void)? ) {
        self.tabBarOffset = tabBarOffset
        self.customTitle = customTitle
        self.customDescription = customDescription
        self.image = image
        self.buttonTitle = buttonTitle
        self.completionBlock = completionBlock
    }
     
}


