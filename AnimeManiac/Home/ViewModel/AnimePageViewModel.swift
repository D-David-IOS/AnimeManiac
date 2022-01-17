//
//  AnimePageViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class AnimePageViewModel: ScrollableViewModel {
    var canRefreshNavBar: Bool = true
    
    var rightButtonItem: AnyBarButtonItem? {
        return .search
    }
    
    var title: String? = "Home"
    var sections: [Section] = []
    var nextPage : String?
    let afService = AnimeRequest()
    var animePage : AnimePage
    
    init(animePage : AnimePage) {
        self.animePage = animePage
    }
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        self.sections = [AnimePageSection(animePage: self.animePage)]
        callback(nil)
    }
}
