//
//  FetchError.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

enum FetchError: Error {
  case noInternet
  case noValue
  
  func getMessage() -> String {
    switch self {
    case .noInternet:
      return NSLocalizedString("error.noInternet", comment: "no internet")
    case .noValue:
      return NSLocalizedString("error.noValue", comment: "no products")
    }
  }
}
