//
//  WishListVM_UsersDefaultTests.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
import XCTest
@testable import AnimeManiac

class WishListVM_UserDefault_Tests: XCTestCase {
    
    var fakeData = FakeData()
    
    
    func testWishListVMWhen_EmptyUserDefaults_SoEmptyError(){
        
        // we delete all Animes with the key
        UserDefaults.standard.removeObject(forKey: StateAnime.Constants.stateAnime.rawValue)
        
        let wishListVM = WishListViewModel()
        
        // Load datas with the animePage ( here : [] )
        wishListVM.loadData { emptyError in
            XCTAssertEqual(emptyError as! AnimeError, AnimeError.emptyWishList)
        }
    }
    
    func testWishListVMWhen_UserDefaultNotEmpty_SoNoError(){
        
        // save one fake StateAnime in UserDefault
        StateAnime.saveAnime(stateAnime: [fakeData.stateAnime])
        
        let wishListVM = WishListViewModel()
        
        // Load datas with the animePage
        wishListVM.loadData { emptyError in
            XCTAssertNil(emptyError)
            XCTAssertEqual(wishListVM.sections.count,1)
        }
        
        // get all animes
        let anime = StateAnime.getAnimes()
        
        // so we have our unique fake StateAnime in our UserDefault
        XCTAssertEqual(anime.first?.title,"Fullmetal Alchemist: Brotherhood")
        XCTAssertEqual(anime.first?.id ,"3936")
        XCTAssertEqual(anime.first?.image ,"https://media.kitsu.io/anime/poster_images/3936/small.jpg")
        XCTAssertEqual(anime.first?.synopsis ,"blabla i'm a synopsis")
        XCTAssertEqual(anime.first?.inProgress ,false)
        XCTAssertEqual(anime.first?.alreadySaw ,false)
    }
   
}
