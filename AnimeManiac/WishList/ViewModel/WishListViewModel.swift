//
//  WishListViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

// represent the wishList page
class WishListViewModel : ScrollableViewModel {
    var sections: [Section] = []
    var title: String? = "WishList"
    
    // loadData is called in the controller
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        
        // get all animes stored in UserDefaults
        let animes = StateAnime.getAnimes()
        
        // if 0 Animes display an Empty error
        if animes.isEmpty {
            self.sections = []
            callback(AnimeError.emptyWishList)
        } else {
            // display all Animes
            sections = [WishListSection(listAnimes : animes)]
            callback(nil)
        }
    }
}
