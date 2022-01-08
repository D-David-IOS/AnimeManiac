//
//  AlamofireService.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation
import Alamofire

final class AlamofireService : API{
    
    func getConvert(endpoint: APIEndpoint, callback: @escaping (Result<Double, FetchError>) -> ()) {
        let url = endpoint.path
        let parameters = endpoint.parameters
        
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseJSON(completionHandler: { response in
                guard let convertJSON = response.value as? NSDictionary else {
                    callback(.failure(.noValue))
                    return
                }
                guard let double = convertJSON.allValues.last as? Double else {
                    callback(.failure(.noValue))
                    return
                }
                        
                callback(.success(double))
            })
    }
    
}
