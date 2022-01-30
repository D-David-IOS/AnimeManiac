//
//  HorizontalAnimePage.swift
//  AnimeManiac
//
//  Created by David-IOS on 16/01/2022.
//

import Foundation

// used for create a "carousel" for show few sections like "more popular" in Home
// title : the name of the "carousel" exemple : most views
// seeAll : the url, used for show more Anime in this category
// animePage : the first Anime in present in the "carousel"
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
