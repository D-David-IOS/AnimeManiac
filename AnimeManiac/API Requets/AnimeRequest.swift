//
//  AnimeRequest.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Alamofire

class AnimeRequest : APIService {
    
    // we create a real Alamofire session for the app, and a mock in the tests
    var sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 10
        configuration.waitsForConnectivity = false
        return Session(configuration: configuration)
    }()
    
    
    func getAnime(url : String, callback : @escaping (Result<ListAnime, AnimeError>) -> Void){
        do {
            sessionManager.request(url, method: .get).responseDecodable(of: ListAnime.self) { response in
                
                guard let data = response.data,response.response?.statusCode == 200 else {
                    callback(.failure(AnimeError.noInternet))
                    return
                }
                
                do {
                    // here we have data, so we try to decode into a list recipe
                    let listAnime = try JSONDecoder().decode(ListAnime.self, from: data)
                    callback(.success(listAnime))
                } catch let jsonErr {
                    // if decode failed, return an error and callback(false,nil)
                    print("Erreur de décodage", jsonErr)
                    callback(.failure(AnimeError.noResultsFound))
                }
            }
        }
    }
  
}
