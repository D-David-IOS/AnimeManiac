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
