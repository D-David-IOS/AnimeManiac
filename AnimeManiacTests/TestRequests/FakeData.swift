//
//  FakeData.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 30/01/2022.
//

import Foundation
@testable import AnimeManiac

class FakeData {
    
    let responseOK = HTTPURLResponse(url: URL(string: "www.google.fr")!,statusCode: 200, httpVersion: nil, headerFields: nil)!
    let responseKO = HTTPURLResponse(url: URL(string: "www.google.fr")!,statusCode: 500, httpVersion: nil, headerFields: nil)!
   
    var correctData : Data {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "ListAnime", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    var incorrectData : Data {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "GoogleTranslate", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    var animePage = AnimePage(title: "Fullmetal Alchemist: Brotherhood", id: "3936", image: "https://media.kitsu.io/anime/poster_images/3936/small.jpg", coverImage: "https://media.kitsu.io/anime/cover_images/3936/small.jpg", dateCreation: "2005", rate: "82.81", episodes: 64, youtubeId: "yb2R1l0O9Zs", synopsis: "blabla i'm a synopsis")
    
    var stateAnime = StateAnime(title: "Fullmetal Alchemist: Brotherhood", id: "3936", image: "https://media.kitsu.io/anime/poster_images/3936/small.jpg", coverImage: "https://media.kitsu.io/anime/cover_images/3936/small.jpg", dateCreation: "2005", rate: "82.81", episodes: 64, youtubeId: "yb2R1l0O9Zs", synopsis: "blabla i'm a synopsis", alreadySaw: false, inProgress: false)

}
