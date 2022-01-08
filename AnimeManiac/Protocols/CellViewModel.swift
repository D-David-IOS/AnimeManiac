//
//  CellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

protocol CellViewModel: AnyObject {
    var nibName: String? { get set }
    var reuseIdentifier: String { get set }
    var indexPath: IndexPath? { get set }
    var routingEntry: RoutingEntry? { get set }
}

protocol TableCellViewModel: CellViewModel {
    var height: Float { get }
    var estimatedHeight: Float { get }
}

protocol TableEditedCellViewModel: TableCellViewModel {
    var canEdit : Bool { get }
}
