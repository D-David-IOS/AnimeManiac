//
//  SearchCategorieViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class SearchCategoryViewModel: InfiniteScrollableViewModel {
    var canRefreshNavBar: Bool = true
    
    var rightButtonItem: AnyBarButtonItem? {
        return .search
    }
    
    var title: String? = "Search"
    var sections: [Section] = []
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    let afService = AnimeRequest()
    var isFetchInProgress: Bool = false
    var category = ""
    
    init(category : String){
        self.category = category
    }
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        print(self.category)
        afService.getAnime(url: "https://kitsu.io/api/edge/anime?page[limit]=20") { success, ListAnime in
            guard let animes = ListAnime, success else {
                callback(SearchError.noResultsFound)
                return
            }
            
            self.nextPage = animes.links.next
            
            var listAnime = [AnimePage]()
            
            for anime in animes.data {
                let title = anime.attributes.slug
                let dateCreation = anime.attributes.startDate
                let rate = anime.attributes.averageRating
                let episodes = anime.attributes.episodeCount
                let ageRating = anime.attributes.ageRating
                
                let animePage = AnimePage(title: title, dateCreation: dateCreation ?? "unknow", rate: rate ?? "none", episodes: episodes, ageRating: ageRating?.rawValue ?? "none")
                listAnime.append(animePage)
            }
            
            self.sections = [SearchCategorySection(listAnime : listAnime, category: self.category)]
            callback(nil)
        }
    }
   
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
        guard !isFetchInProgress, let next = self.nextPage else {
            return
        }
        self.isFetchInProgress = true
        
        afService.getAnime(url: next) { success, ListAnime in
            guard let animes = ListAnime, success else {
                callback(SearchError.noResultsFound)
                return
            }
            
            self.nextPage = animes.links.next
            
            var listAnime = [AnimePage]()
            
            for anime in animes.data {
                let title = anime.attributes.slug
                let dateCreation = anime.attributes.startDate
                let rate = anime.attributes.averageRating
                let episodes = anime.attributes.episodeCount
                let ageRating = anime.attributes.ageRating
                
                let animePage = AnimePage(title: title, dateCreation: dateCreation ?? "unknow", rate: rate ?? "none", episodes: episodes, ageRating: ageRating?.rawValue ?? "none")
                listAnime.append(animePage)
            }
            
            self.sections.append(SearchCategorySection(listAnime : listAnime, category: self.category))
            self.isFetchInProgress = false
            callback(nil)
        }
    }
}
