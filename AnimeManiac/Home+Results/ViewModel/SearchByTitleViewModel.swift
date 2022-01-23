//
//  SearchCategorieViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class SearchByTitleViewModel: InfiniteScrollableViewModel {
    var canRefreshNavBar: Bool = true
    var rightButtonItem: AnyBarButtonItem? 
    
    var title: String?
    var sections: [Section] = []
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    let afService = AnimeRequest()
    var isFetchInProgress: Bool = false
    var search = ""
    
    init(search : String){
        self.search = search
        self.title = "search : "+search.replacingOccurrences(of: "+", with: " ")
    }
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        afService.getAnime(url: "https://kitsu.io/api/edge/anime?filter[text]=\(search)") { success, ListAnime in
            guard let animes = ListAnime, success else {
                callback(SearchError.noResultsFound)
                return
            }
            
            self.nextPage = animes.links.next
            
            var listAnime = [AnimePage]()
            
            for anime in animes.data {
                let title = anime.attributes.canonicalTitle
                let id = anime.id
                let image = anime.attributes.posterImage.small
                let coverImage = anime.attributes.coverImage?.small ?? "https://media.kitsu.io/anime/cover_images/3936/small.jpg"
                let dateCreation = anime.attributes.startDate?.components(separatedBy: "-").first
                let rate = (anime.attributes.averageRating ?? "0")+"%"
                let episodes = anime.attributes.episodeCount
                let ageRating = anime.attributes.ageRating
                let synopsis = anime.attributes.synopsis
                
                let animePage = AnimePage(title: title, id: id, image : image, coverImage: coverImage, dateCreation: dateCreation ?? "unknow", rate: rate, episodes: episodes, ageRating: ageRating?.rawValue ?? "none", synopsis: synopsis ?? "Description will be added later...")
                listAnime.append(animePage)
            }
            
            self.sections = [SearchByTitleSection(listAnime : listAnime, search: self.search)]
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
                let title = anime.attributes.canonicalTitle
                let id = anime.id
                let image = anime.attributes.posterImage.small
                let coverImage = anime.attributes.coverImage?.small ?? "https://media.kitsu.io/anime/cover_images/3936/small.jpg"
                let dateCreation = anime.attributes.startDate?.components(separatedBy: "-").first
                let rate = anime.attributes.averageRating
                let episodes = anime.attributes.episodeCount
                let ageRating = anime.attributes.ageRating
                let synopsis = anime.attributes.synopsis
                
                let animePage = AnimePage(title: title,id : id, image: image, coverImage: coverImage, dateCreation: dateCreation ?? "unknow", rate: rate ?? "none", episodes: episodes, ageRating: ageRating?.rawValue ?? "none", synopsis : synopsis ?? "Description will be added later...")
                listAnime.append(animePage)
            }
            
            self.sections.append(SearchByTitleSection(listAnime : listAnime, search: self.search))
            self.isFetchInProgress = false
            callback(nil)
        }
    }
}
