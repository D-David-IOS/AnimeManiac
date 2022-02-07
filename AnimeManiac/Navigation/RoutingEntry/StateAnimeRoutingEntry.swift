//
//  StateAnimeRoutingEntry.swift
//  AnimeManiac
//
//  Created by David-IOS on 07/02/2022.
//

import Foundation

// used for go to AnimePage
class StateAnimeRoutingEntry : RoutingEntry {
    
    var animePage : AnimePage
    
    init(stateAnime : StateAnime){
        let animePage = AnimePage(title: stateAnime.title, id: stateAnime.id, image: stateAnime.image, coverImage: stateAnime.coverImage, dateCreation: stateAnime.dateCreation, rate: stateAnime.rate, episodes: stateAnime.episodes, youtubeId: stateAnime.youtubeId, synopsis: stateAnime.synopsis)
        self.animePage = animePage
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        let viewModel = AnimePageViewModel(animePage: self.animePage)
        let controller = TableViewController(viewModel: viewModel)
        return .push(controller: controller)
    }
}
