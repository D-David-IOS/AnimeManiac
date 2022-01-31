//
//  AnimeManiacTests.swift
//  AnimeManiacTests
//
//  Created by David-IOS on 08/01/2022.
//

import XCTest
import Alamofire
@testable import AnimeManiac

class AnimeManiacAlamofire: XCTestCase {
    
    let fakeData = FakeData()
    let url = URL(string: "https://kitsu.io/api/edge/anime?sort=-favoritesCount")!
    let urlLiteral =  "https://kitsu.io/api/edge/anime?sort=-favoritesCount"
    
    func testGoodStatusGoodDataSoGoodData() {
        let FakeRequest = AnimeRequest()
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)
        FakeRequest.sessionManager = sessionManager
        let expectation = expectation(description: "Request should finish")
        
        let mock = Mock(url : url, dataType: .json, statusCode: 200, data: [.get: fakeData.correctData])
        mock.register()
        
        FakeRequest.getAnime(url : urlLiteral) { result in
            
            switch result {
            case .success(let animes):
                XCTAssertEqual(animes.data.count, 10)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testBadStatusCodeSoCallbackNil() {
        let FakeRequest = AnimeRequest()
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)
        FakeRequest.sessionManager = sessionManager
        let requestExpectation = expectation(description: "Request should finish")
        
        let mock = Mock(url : url, dataType: .json, statusCode: 500, data: [.get: fakeData.correctData])
        mock.register()
        
        FakeRequest.getAnime(url : urlLiteral) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error as AnimeError, AnimeError.noInternet)
            }
            requestExpectation.fulfill()
            
        }
        wait(for: [requestExpectation], timeout: 10)
    }
    
    func testIncorrectDataSoCallbackNil() {
        let FakeRequest = AnimeRequest()
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)
        FakeRequest.sessionManager = sessionManager
        let requestExpectation = expectation(description: "Request should finish")
        
        let mock = Mock(url : url, dataType: .json, statusCode: 200, data: [.get: fakeData.incorrectData])
        mock.register()
        
        
        FakeRequest.getAnime(url : urlLiteral) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error as AnimeError, AnimeError.noResultsFound)
            }
            requestExpectation.fulfill()
            
        }
        wait(for: [requestExpectation], timeout: 10)
    }
}
