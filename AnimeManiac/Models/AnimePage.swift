//
//  AnimePage.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

struct AnimePage {
    let title : String
    let dateCreation : String
    let rate : String
    let episodes : Int?
    let ageRating : String
    
    init(title : String, dateCreation : String, rate : String, episodes : Int?, ageRating : String){
        self.title = title
        self.dateCreation = dateCreation
        self.rate = rate
        self.episodes = episodes
        self.ageRating = ageRating
    }
    
}
