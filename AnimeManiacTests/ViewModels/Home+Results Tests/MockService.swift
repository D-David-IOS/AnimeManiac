//
//  MockService.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
@testable import AnimeManiac

class MockService : APIService {
    
    // correctData : a JSON with 5 correct Anime
    var correctData : Data {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "ListAnime", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    // Mock the call API getAnime
    // it's very simple, if the url is "badURL" we return an Error
    // any others URL return 5 Anime
    func getAnime(url: String, callback: @escaping (Result<ListAnime, AnimeError>) -> Void) {
        if url == "badURL" {
            callback(.failure(AnimeError.noResultsFound))
        } else {
            let listAnime = try! JSONDecoder().decode(ListAnime.self, from: correctData)
            callback(.success(listAnime))
        }
    }
}
