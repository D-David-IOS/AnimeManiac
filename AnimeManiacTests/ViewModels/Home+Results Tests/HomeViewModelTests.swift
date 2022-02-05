//
//  HomeViewModelTests.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 05/02/2022.
//

import Foundation
import XCTest
@testable import AnimeManiac

class HomeViewModelTests: XCTestCase {
    
    // Instance of ViewModel
    let homeVM = HomeViewModel(apiService: MockService())
    
    func testHomeVMWhen_AllGoodUrl_SoNoErrors(){
        
        // all URL are good
        homeVM.urlLiteral = ["goodURL","goodURL","goodURL","goodURL"]
        
        // callback nil
        homeVM.loadData { error in
            XCTAssertNil(error)
        }
    }
    
    func testHomeVMWhen_BadUrl0_SoError(){
        
        // one URL is bad
        homeVM.urlLiteral = ["badURL","goodURL","goodURL","goodURL"]
        
        // callback an error
        homeVM.loadData { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testHomeVMWhen_BadUrl1_SoError(){
        
        // one URL is bad
        homeVM.urlLiteral = ["goodURL","badURL","goodURL","goodURL"]
        
        // callback an error
        homeVM.loadData { error in
            XCTAssertNotNil(error)
        }
    }
    
    func testHomeVMWhen_BadUrl2_SoError(){
        
        // one URL is bad
        homeVM.urlLiteral = ["goodURL","goodURL","badURL","goodURL"]
        
        // callback an error
        homeVM.loadData { error in
            XCTAssertNotNil(error)
        }
        
    }
    
    func testHomeVMWhen_BadUrl3_SoError(){
        
        // one URL is bad
        homeVM.urlLiteral = ["goodURL","goodURL","goodURL","badURL"]
        
        // callback an error
        homeVM.loadData { error in
            XCTAssertNotNil(error)
        }
    }
    
}
