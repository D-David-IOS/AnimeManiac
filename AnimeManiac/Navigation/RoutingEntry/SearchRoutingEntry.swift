//
//  SeeAllRoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class SearchRoutingEntry : RoutingEntry {
    
    var category : String
    
    init(category : String){
        self.category = category
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let viewModel = SearchCategoryViewModel(category: self.category)
        let controller = TableViewController(viewModel: viewModel)
        return .push(controller: controller)
    }
}
