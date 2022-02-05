//
//  APIRequest.swift
//  AnimeManiac
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation

protocol APIService {
    func getAnime(url : String, callback : @escaping (Result<ListAnime, AnimeError>) -> Void)
}
