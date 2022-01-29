//
//  AnimeStateCellViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 23/01/2022.
//

import Foundation

class StateAnimeCellViewModel : TableEditedCellViewModel {
    var canEdit: Bool = true
    var nibName: String? = "StateAnimeCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var indexPath: IndexPath?
    var routingEntry: RoutingEntry?
    var firstHeader: String?
    var secondsubtitle: String?
    var imageProductCell: URL?
    var height: Float = 90
    var estimatedHeight: Float = 90
    var stateAnime : StateAnime
    
    init(stateAnime : StateAnime) {
        self.stateAnime = stateAnime
    }
    
    func completionDelete(callback: @escaping (EmptyError?) -> ()) {
        var allAnime = StateAnime.getAnimes()
        allAnime = allAnime.filter(){$0.id != stateAnime.id}
        StateAnime.saveAnime(stateAnime: allAnime)
        callback(nil)
        
    }
    
    func completionInProgress(callback: @escaping (EmptyError?) -> ()) {
        var allAnime = StateAnime.getAnimes()
        if let row = allAnime.firstIndex(where: {$0.id == stateAnime.id }) {
            allAnime[row].inProgress = true
        }
        StateAnime.saveAnime(stateAnime: allAnime)
        callback(nil)
    }
    
    func completionAlreadySeen(callback: @escaping (EmptyError?) -> ()) {
        var allAnime = StateAnime.getAnimes()
        if let row = allAnime.firstIndex(where: {$0.id == stateAnime.id }) {
            allAnime[row].alreadySaw = true
        }
        StateAnime.saveAnime(stateAnime: allAnime)
        callback(nil)
    }
    
}
