//
//  SearchByURLRoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 16/01/2022.
//

import Foundation

// used for go in SearchByUrlViewModel
// url is the url for dowload Animes
// title is the title in the navBar
class SearchByURLRoutingEntry : RoutingEntry {
    
    var url : String
    var title : String
    
    init(url : String, title : String){
        self.url = url
        self.title = title
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let viewModel = SearchByURLViewModel(title: self.title, url: self.url, apiService: AnimeRequest())
        let controller = TableViewController(viewModel: viewModel)
        return .push(controller: controller)
    }
}
