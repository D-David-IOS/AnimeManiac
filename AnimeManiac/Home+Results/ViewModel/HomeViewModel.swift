//
//  HomeViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 08/01/2022.
//

// Home page
class HomeViewModel: ScrollableViewModel {
    var title: String? = "Home"
    var sections: [Section] = []
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    let afService = AnimeRequest()
    var isFetchInProgress: Bool = false
    var horizontalPages = [HoritontalAnimePage]()
    
    // loadData is called in the controller
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
    
    // represent differents carousel in home
    func horizontalPage(title : String, url : String,callback: @escaping (EmptyError?) -> ()) {
        afService.getAnime(url: url) { result in
            
            switch result {
            case .failure(let emptyError) :
                callback(emptyError)
            case .success(let animes) :
                var listAnime = [AnimePage]()
                
                for anime in animes.data {
                    let title = anime.attributes.canonicalTitle
                    let id = anime.id
                    let image = anime.attributes.posterImage.small
                    let coverImage = anime.attributes.coverImage?.small ?? "https://media.kitsu.io/anime/cover_images/3936/small.jpg"
                    let dateCreation = anime.attributes.startDate?.components(separatedBy: "-").first
                    let rate = (anime.attributes.averageRating ?? "0")+"%"
                    let episodes = anime.attributes.episodeCount
                    let youtubeId = anime.attributes.youtubeVideoID
                    let synopsis = anime.attributes.synopsis
                    
                    let animePage = AnimePage(title: title, id: id, image : image, coverImage: coverImage, dateCreation: dateCreation ?? "unknow", rate: rate, episodes: episodes, youtubeId: youtubeId, synopsis: synopsis ?? "Description will be added later...")
                    listAnime.append(animePage)
                }
                self.horizontalPages.append(HoritontalAnimePage(title: title, seeAll: url, animePage: listAnime))
                callback(nil)
            }
        }
    }
}
