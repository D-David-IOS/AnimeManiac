//
//  ScrollableViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

protocol ScrollableViewModel {
    var sections: [Section] { get set }
    func loadData(callback: @escaping (EmptyError?) -> ())
    var canRefreshNavBar : Bool { get }
    var title : String? { get }
}

extension ScrollableViewModel {
    
    func numberOfSections() -> Int {
        return self.sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard self.sections.count > 0 else {
            return 0
        }
        return self.sections[section].cellsVM.count
    }
    
    func item(at indexPath: IndexPath) -> CellViewModel {
        return self.sections[indexPath.section].cellsVM[indexPath.row]
    }
    
    mutating func remove(at indexPath : IndexPath) {
        self.sections[indexPath.section].remove(index: indexPath.row)
    }
    
    func itemAvailable(at indexPath: IndexPath) -> Bool {
        return self.sections.count > indexPath.section && self.sections[indexPath.section].cellsVM.count > indexPath.row
    }
    
}


protocol InfiniteScrollableViewModel: ScrollableViewModel {
    var canLoadMore: Bool { get }
    var isFetchInProgress: Bool { get set }
    func loadMore(callback: @escaping (EmptyError?) -> ())
}

extension InfiniteScrollableViewModel {
    func isLoadingSection(for indexPath: IndexPath) -> Bool {
        return indexPath.section == self.sections.count-1
    }
}
