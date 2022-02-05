//
//  SearchByTitleViewModelTests.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
import XCTest
@testable import AnimeManiac

class SearchByTitleViewModelTests: XCTestCase {
    
    // Instance of ViewModel
    let byTitleVM = SearchByTitleViewModel(search: "blabla", url: "goodUrl", apiService: MockService())
    
    func testByTitleVMWhen_GoodUrl_NoErrors(){
        
        // the URL is good so no error
        byTitleVM.loadData { error in
            XCTAssertNil(error)
        }
        
        // our fake Json has a nextPage so canLoadMore is true
        XCTAssertEqual(byTitleVM.canLoadMore, true)
        
        // next page will load with succes so no error
        byTitleVM.loadMore{ error in
            XCTAssertNil(error)
        }
        
    }
    
    func testByTitleVMWhen_GoodURL_ButBadUrlNext_Page(){
        
        // the URL is good so no error
        byTitleVM.loadData { error in
            XCTAssertNil(error)
        }
        
        // we change nexPage to a bad URL so we have an error
        byTitleVM.nextPage = "badURL"
        
        // bad URL for nextpage so we have an error
        byTitleVM.loadMore{ error in
            XCTAssertNotNil(error)
        }
    }
    
    func testByTitleVMWhen_AllBadUrl_SoCallbackError(){
        
        byTitleVM.url = "badURL"
        
        // the URL is bad so we had an error
        byTitleVM.loadData { error in
            XCTAssertNotNil(error)
        }
        
        // we have no results, so we can't load more
        XCTAssertEqual(byTitleVM.canLoadMore, false)
        
        byTitleVM.nextPage = "badURL"
        
        // bad URL so we have an error
        byTitleVM.loadMore{ error in
            XCTAssertNotNil(error)
        }
        
        // just an example, if the nextpage is nil
        byTitleVM.nextPage = nil
        
        // a Guard in loadMore stop the function because we haven't nextPage
        // so nothing happend
        byTitleVM.loadMore{ error in
            XCTFail()
        }
        
    }
    
}
