//
//  AnimePageViewModelTests.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
import XCTest
@testable import AnimeManiac

class AnimePageViewModelTests: XCTestCase {
    
    var fakeData = FakeData()
    
    func testAnimePageVMWhen_GoodUrl_NoErrors(){
        // Instance of ViewModel
        let AnimePageVM = AnimePageViewModel(animePage: fakeData.animePage)
        
        // Load datas with the animePage
        AnimePageVM.loadData { error in
            XCTAssertNil(error)
        }
    }
}

