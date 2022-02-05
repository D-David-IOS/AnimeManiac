//
//  SearchByURLViewModelTests.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
import XCTest
@testable import AnimeManiac

class SearchByURLViewModelTests: XCTestCase {
    
    // Instance of ViewModel
    let searchVM = SearchByURLViewModel(title: "blabla", url: "goodURL", apiService: MockService())
    
    func testSearchVMWhen_GoodUrl_NoErrors(){
        
        // the URL is good so no error
        searchVM.loadData { error in
            XCTAssertNil(error)
        }
        
        // our fake Json has a nextPage so canLoadMore is true
        XCTAssertEqual(searchVM.canLoadMore, true)
        
        // next page will load with succes so no error
        searchVM.loadMore{ error in
            XCTAssertNil(error)
        }
        
    }
    
    func testSearchVMWhen_GoodURL_ButBadUrlNext_Page(){
        
        searchVM.url = "goodUrl"
        
        // the URL is good so no error
        searchVM.loadData { error in
            XCTAssertNil(error)
        }
        
        // we change nexPage to a bad URL so we have an error
        searchVM.nextPage = "badURL"
        
        // bad URL for nextpage so we have an error
        searchVM.loadMore{ error in
            XCTAssertNotNil(error)
        }
    }
    
    func testSearchVMWhen_AllBadUrl_SoCallbackError(){
        
        searchVM.url = "badURL"
        
        // the URL is bad so we had an error
        searchVM.loadData { error in
            XCTAssertNotNil(error)
        }
        
        // we have no results, so we can't load more
        XCTAssertEqual(searchVM.canLoadMore, false)
        
        searchVM.nextPage = "badURL"
        
        // bad URL so we have an error
        searchVM.loadMore{ error in
            XCTAssertNotNil(error)
        }
        
        // just an example, if the nextpage is nil
        searchVM.nextPage = nil
        
        // a Guard in loadMore stop the function because we haven't nextPage
        // so nothing happend
        searchVM.loadMore{ error in
            XCTFail()
        }
        
    }
    
}
