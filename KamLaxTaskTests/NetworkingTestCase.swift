//
//  NetworkingTestCase.swift
//  KamLaxTaskTests
//
//  Created by Ducont on 23/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import XCTest
import Foundation

class NetworkingTestCase: XCTestCase {
   var httpClient: HttpClient!
   let session = MockURLSession()
    
    let SearchURL : String = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=mig5kAVQ9wsoCKssV1HTbImtxZk8brq0"
    let EmailedURL : String = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=mig5kAVQ9wsoCKssV1HTbImtxZk8brq0"
    let SharedURL : String = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=mig5kAVQ9wsoCKssV1HTbImtxZk8brq0"
     
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK:- SearchApi Mock Test
     
    func test_get_request_with_URL() {

         guard let url = URL(string: SearchURL) else {
             fatalError("URL can't be empty")
         }
         
         httpClient.get(url: url) { (success, response) in
             // Return data
         }
         
         XCTAssert(session.lastURL == url)
         
     }
     
     func test_get_resume_called() {
         
         let dataTask = MockURLSessionDataTask()
         session.nextDataTask = dataTask
         
         guard let url = URL(string: SearchURL) else {
             fatalError("URL can't be empty")
         }
         
         httpClient.get(url: url) { (success, response) in
             // Return data
         }
         
         XCTAssert(dataTask.resumeWasCalled)
     }
    
     func test_get_should_return_data() {
         let expectedData = "{}".data(using: .utf8)
         
         session.nextData = expectedData
         
         var actualData: Data?
         httpClient.get(url: URL(string: SearchURL)!) { (data, error) in
             actualData = data
         }
         
         XCTAssertNotNil(actualData)
     }


}
//MARK:- MostPopular Emailed Mock API Test
extension NetworkingTestCase {
    func test_get_Emailed_URL() {
        
         guard let url = URL(string: EmailedURL) else {
             fatalError("URL can't be empty")
         }
         
         httpClient.get(url: url) { (success, response) in
             // Return data
         }
         
         XCTAssert(session.lastURL == url)
         
     }
     
     func test_get_resume_Emailed_called() {
         
         let dataTask = MockURLSessionDataTask()
         session.nextDataTask = dataTask
         
         guard let url = URL(string: EmailedURL) else {
             fatalError("URL can't be empty")
         }
         
         httpClient.get(url: url) { (success, response) in
             // Return data
         }
         
         XCTAssert(dataTask.resumeWasCalled)
     }
    
     func test_get_Emailed_return_data() {
         let expectedData = "{}".data(using: .utf8)
         
         session.nextData = expectedData
         
         var actualData: Data?
         httpClient.get(url: URL(string: EmailedURL)!) { (data, error) in
             actualData = data
         }
         
         XCTAssertNotNil(actualData)
     }

}

//MARK:- MostPopular Shared Mock API Test
extension NetworkingTestCase {
    func test_get_Shared_URL() {

         guard let url = URL(string: SharedURL) else {
             fatalError("URL can't be empty")
         }
         
         httpClient.get(url: url) { (success, response) in
             // Return data
         }
         
         XCTAssert(session.lastURL == url)
         
     }
     
     func test_get_resume_Shared_called() {
         
         let dataTask = MockURLSessionDataTask()
         session.nextDataTask = dataTask
         
         guard let url = URL(string: SharedURL) else {
             fatalError("URL can't be empty")
         }
         
         httpClient.get(url: url) { (success, response) in
             // Return data
         }
         
         XCTAssert(dataTask.resumeWasCalled)
     }
    
     func test_get_Emailed_Shared_data() {
         let expectedData = "{}".data(using: .utf8)
         
         session.nextData = expectedData
         
         var actualData: Data?
         httpClient.get(url: URL(string: SharedURL)!) { (data, error) in
             actualData = data
         }
         
         XCTAssertNotNil(actualData)
     }

}
