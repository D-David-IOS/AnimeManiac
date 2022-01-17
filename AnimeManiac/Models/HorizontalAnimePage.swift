//
//  HorizontalAnimePage.swift
//  AnimeManiac
//
//  Created by David-IOS on 16/01/2022.
//

import Foundation

struct HoritontalAnimePage {
    var title : String
    var seeAll: String
    var animePage : [AnimePage]
    
    init(title:String,seeAll:String, animePage: [AnimePage]){
        self.title = title
        self.seeAll = seeAll
        self.animePage = animePage
    }
    
}
