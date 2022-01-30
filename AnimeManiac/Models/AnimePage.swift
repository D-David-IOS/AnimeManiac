//
//  AnimePage.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

// The modal for an Anime
// title : Anime title
// id : the unique id of the anime
// image : url of the principal image
// coverImage : url of the cover image
// dateCreation : the date when the anime started
// rate : the % of people like the Anime
// episodes : number of episodes
// youtubeID : id of the Anime trailer
// synopsis : the Anime Description
struct AnimePage {
    let title : String
    let id : String
    let image : String
    let coverImage : String
    let dateCreation : String
    let rate : String
    let episodes : Int?
    let youtubeId : String?
    var synopsis : String
    
    init(title : String,id : String, image : String,coverImage : String, dateCreation : String, rate : String, episodes : Int?, youtubeId : String?, synopsis : String){
        self.title = title
        self.id = id
        self.image = image
        self.coverImage = coverImage
        self.dateCreation = dateCreation
        self.rate = rate
        self.episodes = episodes
        self.youtubeId = youtubeId
        self.synopsis = synopsis
    }
    
}
