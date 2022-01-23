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
    var horizontalPages = [HoritontalAnimePage]()
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        horizontalPage(title: "Coming soon", url: "https://kitsu.io/api/edge/anime?sort=-startDate") {_ in
            self.horizontalPage(title: "Our favorite list", url: "https://kitsu.io/api/edge/anime?sort=-favoritesCount") {_ in
                self.horizontalPage(title: "The best rate", url: "https://kitsu.io/api/edge/anime?sort=-averageRating") {_ in
                    self.horizontalPage(title: "The most Popular", url: "https://kitsu.io/api/edge/anime?sort=popularityRank") {_ in
                        self.sections = [HomeSection(horizontalPages: self.horizontalPages)]
                        self.horizontalPages = []
                        callback(nil)
                    }
                }
            }
            
        }
        
    }
    
    func horizontalPage(title : String, url : String,callback: @escaping (EmptyError?) -> ()) {
        afService.getAnime(url: url) { success, ListAnime in
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
            self.horizontalPages.append(HoritontalAnimePage(title: title, seeAll: url, animePage: listAnime))
            callback(nil)
        }
        
    }
   
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
       
    }
}
