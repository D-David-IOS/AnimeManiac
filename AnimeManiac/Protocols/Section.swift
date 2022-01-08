//
//  Section.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

import Foundation

class Section {
    var position: Int = 0
    var title: String?
    var cellsVM: [CellViewModel] = [CellViewModel]()
    var shouldRefreshAll: Bool = false
        
    func remove(index: Int) {
        self.cellsVM.remove(at: index)
    }
}

class TableSection: Section {
    var heightForHeader: Int = 30
}

class CollectionSection: Section {
    var headerVM: CellViewModel?
}
