//
//  AnimePageViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class AnimePageViewModel: ScrollableViewModel {
    var canRefreshNavBar: Bool = true
    var title: String? = "Home"
    var sections: [Section] = []
    var nextPage : String?
    var animePage : AnimePage
    
    init(animePage : AnimePage) {
        self.animePage = animePage
    }
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        self.sections = [AnimePageSection(animePage: self.animePage)]
        callback(nil)
    }
}
