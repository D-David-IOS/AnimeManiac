//
//  FakeData.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 30/01/2022.
//

import Foundation

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

}
