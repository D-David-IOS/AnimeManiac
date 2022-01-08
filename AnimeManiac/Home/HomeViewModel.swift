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
    let afService : API
    var isFetchInProgress: Bool = false
    
    init( afService : API) {
        self.afService = afService
    }
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        
    }
   
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
        guard !isFetchInProgress else {
            return
        }
        self.isFetchInProgress = true
        
    }
}
