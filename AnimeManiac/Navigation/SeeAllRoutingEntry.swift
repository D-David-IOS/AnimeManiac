//
//  SeeAllRoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

class SeeAllRoutingEntry : RoutingEntry {
    
    var category : String = ""
    
    init(category : String){
        self.category = category
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let viewModel = SeeAllViewModel()
        let controller = CollectionViewController(viewModel: viewModel,
                                                  compositionalLayout: SeeAllCompositionalLayout())
        return .push(controller: controller)
    }
}
