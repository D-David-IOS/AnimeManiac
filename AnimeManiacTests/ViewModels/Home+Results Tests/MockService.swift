//
//  MockService.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
@testable import AnimeManiac

class MockService : APIService {
    
    var correctData : Data {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "ListAnime", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    func getAnime(url: String, callback: @escaping (Result<ListAnime, AnimeError>) -> Void) {
        if url == "badURL" {
            callback(.failure(AnimeError.noResultsFound))
        } else {
           
                let listAnime = try! JSONDecoder().decode(ListAnime.self, from: correctData)
                callback(.success(listAnime))
            
        }
    }
    
    
}
