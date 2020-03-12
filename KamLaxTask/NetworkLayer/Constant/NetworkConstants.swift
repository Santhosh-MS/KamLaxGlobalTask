//
//  NetworkConstants.swift
//  KamLaxTask
//
//  Created by Ducont on 22/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import Foundation

extension Constants{
    struct Service {
        static let baseurl = "https://api.nytimes.com/svc/"
        static let timeOut : TimeInterval = 60.0
        static let APIKey : String = "api-key=mig5kAVQ9wsoCKssV1HTbImtxZk8brq0"
        static var SearchURL : String = ""
        static let MostEmailed : String = "mostpopular/v2/emailed/7.json?"
        static let MostViewed : String = "mostpopular/v2/viewed/1.json?"
        static let MostShares : String = "mostpopular/v2/shared/30/facebook.json?"
    }
}
