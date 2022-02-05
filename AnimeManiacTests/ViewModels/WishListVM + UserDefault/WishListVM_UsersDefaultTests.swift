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
        
        var anime = StateAnime.getAnimes()
        
        var wishListVM = WishListViewModel()
        
        // Load datas with the animePage
        AnimePageVM.loadData { error in
            XCTAssertNil(error)
        }
    }
}
