//
//  WishListViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

class WishListViewModel : ScrollableViewModel {
    var sections: [Section] = []
    var canRefreshNavBar: Bool = true
    var title: String? = "WishList"
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        
        let animes = StateAnime.getAnimes()
        
        if animes.isEmpty {
            self.sections = []
            callback(SearchError.noResultsFound)
        } else {
            sections = [WishListSection(listAnimes : animes)]
            callback(nil)
        }
        
    }
  
    
    
}
