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
    var rightButtonItem: AnyBarButtonItem?
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        guard StateAnime.getAnimes().count != 0 else {
            callback(SearchError.noResultsFound)
            return
        }
        
        let animes = StateAnime.getAnimes()
        
        sections = [WishListSection(listAnimes : animes)]
        callback(nil)
    }
  
    
    
}
