//
//  AnimePageViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class AnimePageViewModel: ScrollableViewModel {
    var title: String? = "Home"
    var sections: [Section] = []
    var animePage : AnimePage
    
    init(animePage : AnimePage) {
        self.animePage = animePage
    }
    
    // loadData is called in the controller
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        self.sections = [AnimePageSection(animePage: self.animePage)]
        callback(nil)
    }
}
