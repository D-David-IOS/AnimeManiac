//
//  HomeViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class HomeViewModel: InfiniteScrollableViewModel {
    var canRefreshNavBar: Bool = true
    
    var rightButtonItem: AnyBarButtonItem? {
        return .search
    }
    
    var title: String? = "Home"
    var sections: [Section] = []
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    let afService = AnimeRequest()
    var isFetchInProgress: Bool = false
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        afService.getAnime(url: "https://kitsu.io/api/edge/anime?page[limit]=20") { success, ListAnime in
            guard ListAnime != nil && success else {
                callback(SearchError.noResultsFound)
                return 
            }
            print(ListAnime?.data[0].attributes)
            
            callback(nil)
        }
    }
   
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
        guard !isFetchInProgress else {
            return
        }
        self.isFetchInProgress = true
        
    }
}
