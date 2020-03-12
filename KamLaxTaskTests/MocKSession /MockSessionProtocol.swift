//
//  MockSessionProtocol.swift
//  KamLaxTaskTests
//
//  Created by Ducont on 23/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
     typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
        
        func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
    }
protocol URLSessionDataTaskProtocol {
    func resume()
}
