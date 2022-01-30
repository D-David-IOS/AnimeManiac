//
//  SearchByTitleRountingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 15/01/2022.
//

import Foundation

// used for go in SearchByTitleViewModel
// search is the text in the SearchBar in Home
class SearchByTitleRoutingEntry : RoutingEntry {
    
    var search : String
    
    init(search : String){
        self.search = search
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let viewModel = SearchByTitleViewModel(search: search)
        let controller = TableViewController(viewModel: viewModel)
        return .push(controller: controller)
    }
}
