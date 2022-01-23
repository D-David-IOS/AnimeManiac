//
//  AnimePage.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

struct AnimePage {
    let title : String
    let id : String
    let image : String
    let coverImage : String
    let dateCreation : String
    let rate : String
    let episodes : Int?
    let ageRating : String
    var synopsis : String
    
    init(title : String,id : String, image : String,coverImage : String, dateCreation : String, rate : String, episodes : Int?, ageRating : String, synopsis : String){
        self.title = title
        self.id = id
        self.image = image
        self.coverImage = coverImage
        self.dateCreation = dateCreation
        self.rate = rate
        self.episodes = episodes
        self.ageRating = ageRating
        self.synopsis = synopsis
    }
    
}
