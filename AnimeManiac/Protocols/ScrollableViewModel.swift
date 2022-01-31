//
//  ScrollableViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

// all ViewModel has a Section Array and a function LoadData called in the Controller
// we can change the title too
protocol ScrollableViewModel {
    var sections: [Section] { get set }
    func loadData(callback: @escaping (EmptyError?) -> ())
    var title : String? { get }
}

extension ScrollableViewModel {
    
    // return the number of sections in the ViewModel
    func numberOfSections() -> Int {
        return self.sections.count
    }
    
    // return the number of items prensent in the section
    func numberOfItems(in section: Int) -> Int {
        guard self.sections.count > 0 else {
            return 0
        }
        return self.sections[section].cellsVM.count
    }
    
    // return the item at indexPath
    func item(at indexPath: IndexPath) -> CellViewModel {
        return self.sections[indexPath.section].cellsVM[indexPath.row]
    }
}

// infiniteScrollableView can load more Anime
protocol InfiniteScrollableViewModel: ScrollableViewModel {
    // return true if we can load a next page
    var canLoadMore: Bool { get }
    // return true if a request is in progress
    var isFetchInProgress: Bool { get set }
    // Load the next Anime Page
    func loadMore(callback: @escaping (EmptyError?) -> ())
}

extension InfiniteScrollableViewModel {
    // Called when we scroll at the end of the section
    func isLoadingSection(for indexPath: IndexPath) -> Bool {
        return indexPath.section == self.sections.count-1
    }
}
