//
//  SearchCategorieViewModel.swift
//  AnimeManiac
//
//  Created by David-IOS on 09/01/2022.
//

import Foundation

class SearchByURLViewModel: InfiniteScrollableViewModel {
    var canRefreshNavBar: Bool = true
    var title: String?
    var sections: [Section] = []
    var nextPage : String?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    let afService = AnimeRequest()
    var isFetchInProgress: Bool = false
    var url :String
    
    init(title: String, url : String){
        self.title = title
        self.url = url
    }
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        afService.getAnime(url: self.url) { listAnime in
            guard let animes = listAnime else {
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
                let youtubeId = anime.attributes.youtubeVideoID
                let synopsis = anime.attributes.synopsis
                
                let animePage = AnimePage(title: title, id: id, image : image, coverImage: coverImage, dateCreation: dateCreation ?? "unknow", rate: rate, episodes: episodes, youtubeId: youtubeId, synopsis: synopsis ?? "Description will be added later...")
                listAnime.append(animePage)
            }
            
            self.sections = [SearchCategorySection(listAnime : listAnime, category: "")]
            callback(nil)
        }
    }
   
    func loadMore(callback: @escaping (EmptyError?) -> ()) {
        guard !isFetchInProgress, let next = self.nextPage else {
            return
        }
        self.isFetchInProgress = true
        
        afService.getAnime(url: next) { listAnime in
            guard let animes = listAnime else {
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
