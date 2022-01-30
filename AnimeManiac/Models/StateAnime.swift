//
//  StateAnime.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

// The same modal than Anime but Codable and 2 new properties
// alreadySaw : Anime already seen : true or false
// inProgress : Anime in progress : true or false
struct StateAnime: Codable {
    let title : String
    let id : String
    let image : String
    let coverImage : String
    let dateCreation : String
    let rate : String
    let episodes : Int?
    let youtubeId : String?
    var synopsis : String
    var alreadySaw : Bool
    var inProgress : Bool
    
  
  enum Constants: String {
    case stateAnime
  }
  
  
  // Save an StateAnime Array in userDefault
  static func saveAnime(stateAnime : [StateAnime]) {
    do {
      // Create JSON Encoder
      let encoder = JSONEncoder()
      
      // Encode Note
      let data = try encoder.encode(stateAnime)
      
      // Write/Set Data
      UserDefaults.standard.set(data, forKey: Constants.stateAnime.rawValue)
      
    } catch {
      print("Unable to Encode Anime (\(error))")
    }
  }
  
  // get all Anime Stored in userDefault with the identifier "stateAnime"
  static func getAnimes() -> [StateAnime] {
    // Read/Get Data
    if let data = UserDefaults.standard.data(forKey: Constants.stateAnime.rawValue) {
      do {
        // Create JSON Decoder
        let decoder = JSONDecoder()
        
        // Decode Note
        let users = try decoder.decode([StateAnime].self, from: data)
        return users
      } catch {
        print("Unable to Decode Animes (\(error))")
        return [StateAnime]()
      }
    }
    return [StateAnime]()
  }
    
}
