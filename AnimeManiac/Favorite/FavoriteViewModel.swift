//
//  FavoriteViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class FavoriteViewModel: InfiniteScrollableViewModel {
    
    var sections: [Section]  = []
    var rightButtonItem: AnyBarButtonItem?
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    var isFetchInProgress: Bool = false
    var canRefreshNavBar: Bool = true
    var title: String? = "Favorite"
    let afService : API
    
    init( afService : API) {
        self.afService = afService
    }
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        
    }
    
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
        
    }
    
    
}
