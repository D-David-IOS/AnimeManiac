//
//  HomeViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

class HomeViewModel: InfiniteScrollableViewModel {
    var canRefreshNavBar: Bool = true
    
    var rightButtonItem: AnyBarButtonItem? {
        return .search
    }
    
    var title: String? = "Home"
    var sections: [Section] = []
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    let afService = AnimeRequest()
    var isFetchInProgress: Bool = false
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        afService.getAnime(url: "https://kitsu.io/api/edge/anime?sort=-averageRating") { success, ListAnime in
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
                let dateCreation = anime.attributes.startDate?.components(separatedBy: "-").first
                let rate = (anime.attributes.averageRating ?? "0")+"%"
                let episodes = anime.attributes.episodeCount
                let ageRating = anime.attributes.ageRating
                let synopsis = anime.attributes.synopsis
                
                let animePage = AnimePage(title: title, id: id, image : image, dateCreation: dateCreation ?? "unknow", rate: rate, episodes: episodes, ageRating: ageRating?.rawValue ?? "none", synopsis: synopsis ?? "Description will be added later...")
                listAnime.append(animePage)
            }
            self.sections = [HomeSection(animePage: listAnime)]
            callback(nil)
        }
    }
   
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
        guard !isFetchInProgress else {
            return
        }
        self.isFetchInProgress = true
        
    }
}
