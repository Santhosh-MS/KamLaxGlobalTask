//
//  RootViewModel.swift
//  KamLaxTask
//
//  Created by Ducont on 22/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import Foundation

class RootViewModel  {
    
    var httpClient : HttpClient!

    init(client : HttpClient? = nil ){
           self.httpClient = client ?? HttpClient.shared
       }

}
