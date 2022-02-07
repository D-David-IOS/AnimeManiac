//
//  CellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

import Foundation

protocol CellViewModel: AnyObject {
    // the CellViewModel's nibName
    var nibName: String? { get set }
    // the TableViewCell ReuseIdentifier
    var reuseIdentifier: String { get set }
    // the indexPath for know the section and the row
    var indexPath: IndexPath? { get set }
    // the action when a cell is pressed ( push, present, etc... a controller)
    var routingEntry: RoutingEntry? { get set }
}

protocol TableCellViewModel: CellViewModel {
    // cell Height
    var height: Float { get }
    // cell estimated Height
    var estimatedHeight: Float { get }
}

// only TableEditedCellViewModel can be Edited ( Delete/seen/already_saw for in wishList)
protocol TableEditedCellViewModel: TableCellViewModel {
    // return true if we can edit the cell
    var canEdit : Bool { get }
    // Anime stored in UserDefaults
    var stateAnime : StateAnime { get set }
    // completionBlock after delete action
    func completionDelete(callback: @escaping (EmptyError?) -> ())
    // completionBlock after InProgress action
    func completionInProgress(callback: @escaping (EmptyError?) -> ())
    // completionBlock after AlreadySeen action
    func completionAlreadySeen(callback: @escaping (EmptyError?) -> ())
}
