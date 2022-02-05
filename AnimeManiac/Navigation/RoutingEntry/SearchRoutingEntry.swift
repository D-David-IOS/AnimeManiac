//
//  SeeAllRoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

// used for go in SearchCategoryViewModel
// category is the category selected in picker view in Home
class SearchRoutingEntry : RoutingEntry {
    
    var category : String
    
    init(category : String){
        self.category = category
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let viewModel = SearchCategoryViewModel(category: self.category, url: "https://kitsu.io/api/edge/anime?filter[categories]=\(category)&page[limit]=20&sort=-averageRating", apiService: AnimeRequest())
        let controller = TableViewController(viewModel: viewModel)
        return .push(controller: controller)
    }
}
