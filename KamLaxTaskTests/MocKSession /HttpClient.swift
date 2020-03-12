//
//  HttpClient.swift
//  KamLaxTaskTests
//
//  Created by Ducont on 23/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import Foundation

class HttpClient {
    
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
        
    }
    
    func get( url: URL, callback: @escaping completeClosure ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
    
    //MARK: Conform the protocol
   

}

extension URLSession: URLSessionProtocol {
       func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
           return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
       }
   }

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
