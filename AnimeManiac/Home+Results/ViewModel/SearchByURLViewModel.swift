//
//  SearchCategorieViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

// searchByUrl page
class SearchByURLViewModel: InfiniteScrollableViewModel {
    var title: String?
    var sections: [Section] = []
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    var isFetchInProgress: Bool = false
    var url :String
    let afService : APIService
    
    // title reprensent the text in the navBar
    // apiService : AnimeRequest in app, MockService in Tests
    init(title: String, url : String,apiService : APIService){
        self.title = title
        self.url = url
        self.afService = apiService
    }
    
    // loadData is called in the controller
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        afService.getAnime(url: self.url) { result in
            
            switch result {
            case .failure(let emptyError) :
                callback(emptyError)
            case .success(let animes) :
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
                    let youtubeId = anime.attributes.youtubeVideoID
                    let synopsis = anime.attributes.synopsis
                    
                    let animePage = AnimePage(title: title, id: id, image : image, coverImage: coverImage, dateCreation: dateCreation ?? "unknow", rate: rate, episodes: episodes, youtubeId: youtubeId, synopsis: synopsis ?? "Description will be added later...")
                    listAnime.append(animePage)
                }
                
                self.sections = [SearchCategorySection(listAnime : listAnime, category: "")]
                callback(nil)
            }
        }
    }
    
    // load the next page called in the controller
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
        guard !isFetchInProgress, let next = self.nextPage else {
            return
        }
        self.isFetchInProgress = true
        
        afService.getAnime(url: next) { result in
            
            switch result {
            case .failure(let emptyError) :
                callback(emptyError)
            case .success(let animes) :
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
                    let youtubeId = anime.attributes.youtubeVideoID
                    let synopsis = anime.attributes.synopsis
                    
                    let animePage = AnimePage(title: title,id : id, image: image, coverImage: coverImage, dateCreation: dateCreation ?? "unknow", rate: rate ?? "none", episodes: episodes, youtubeId: youtubeId, synopsis : synopsis ?? "Description will be added later...")
                    listAnime.append(animePage)
                }
                
                self.sections.append(SearchCategorySection(listAnime : listAnime, category: ""))
                self.isFetchInProgress = false
                callback(nil)
            }
        }
    }
}
