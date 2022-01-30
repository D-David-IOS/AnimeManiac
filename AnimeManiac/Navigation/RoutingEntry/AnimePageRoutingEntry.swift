//
//  AnimePageRoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 16/01/2022.
//

import Foundation

// used for go in SearchByUrlViewModel
// url is the url for dowload Animes
// title is the title in the navBar
class AnimePageRoutingEntry : RoutingEntry {
    
    var animePage : AnimePage
    
    init(animePage : AnimePage){
        self.animePage = animePage
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let viewModel = AnimePageViewModel(animePage: self.animePage)
        let controller = TableViewController(viewModel: viewModel)
        return .push(controller: controller)
    }
}
