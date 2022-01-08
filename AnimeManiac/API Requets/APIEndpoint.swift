//
//  APIEndpoint.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

protocol APIEndpoint {
    var path: String { get }
    var parameters: String? { get }
}
