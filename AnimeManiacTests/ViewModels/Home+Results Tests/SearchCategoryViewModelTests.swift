//
//  SearchCategoryViewModelTests.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
import XCTest
@testable import AnimeManiac

class SearchCategoryViewModelTests: XCTestCase {
    
    // Instance of ViewModel
    let categoryVM = SearchCategoryViewModel(category: "Horror", url: "goodUrl", apiService: MockService())
    
    func testCategoryVMWhen_GoodUrl_NoErrors(){
        
        // the URL is good so no error
        categoryVM.loadData { error in
            XCTAssertNil(error)
        }
        
        // our fake Json has a nextPage so canLoadMore is true
        XCTAssertEqual(categoryVM.canLoadMore, true)
        
        // next page will load with succes so no error
        categoryVM.loadMore{ error in
            XCTAssertNil(error)
        }
        
    }
    
    func testCategoryVMWhen_GoodURL_ButBadUrlNext_Page(){
        
        // the URL is good so no error
        categoryVM.loadData { error in
            XCTAssertNil(error)
        }
        
        // we change nexPage to a bad URL so we have an error
        categoryVM.nextPage = "badURL"
        
        // bad URL for nextpage so we have an error
        categoryVM.loadMore{ error in
            XCTAssertNotNil(error)
        }
    }
    
    func testCategoryVMWhen_AllBadUrl_SoCallbackError(){
        
        categoryVM.url = "badURL"
        
        // the URL is bad so we had an error
        categoryVM.loadData { error in
            XCTAssertNotNil(error)
        }
        
        // we have no results, so we can't load more
        XCTAssertEqual(categoryVM.canLoadMore, false)
        
        categoryVM.nextPage = "badURL"
        
        // bad URL so we have an error
        categoryVM.loadMore{ error in
            XCTAssertNotNil(error)
        }
        
        // just an example, if the nextpage is nil
        categoryVM.nextPage = nil
        
        // a Guard in loadMore stop the function because we haven't nextPage
        // so nothing happend
        categoryVM.loadMore{ error in
            XCTFail()
        }
        
    }
    
}
