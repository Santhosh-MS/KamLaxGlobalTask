//
//  DetailViewModel.swift
//  KamLaxTask
//
//  Created by Ducont on 22/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import Foundation


protocol PopularArticlesDelegate {
    func mostPopularArticles(ArticlesMost : [Any]) ->Void
    func SearchArticles(SearchDatas : [Any]) ->Void
}

class DetailViewModel {
    var httpClient : HttpClient!
    var PopularType : Int?
    var articleDelagate : PopularArticlesDelegate?
    init(){
        let client : HttpClient? = nil
        self.httpClient = client ?? HttpClient.shared
    }
    
    func setMostPopularArt(PopularType : Int) -> Void {
        switch PopularType {
        case 2:                  //Emailed
            print("Emailed")
            getArticleData(request : ContactAPI.Articles(UrlMethod: Constants.Service.MostEmailed))
        case 3:                    //Viewed
            print("Viewed")
            getArticleData(request : ContactAPI.Articles(UrlMethod: Constants.Service.MostViewed))
        case 4:                  //Shared
            print("Shared")
            getArticleData(request : ContactAPI.Articles(UrlMethod: Constants.Service.MostShares))
            
        default :
           print("Search")
           getSearchDataReq(request : ContactAPI.Articles(UrlMethod: Constants.Service.SearchURL))
        }
    }
    
}
//MARK:- Http Request for Popular Articles
extension DetailViewModel {
    func getArticleData(request : RequestProtocol){
        print("Test -> \(request)")
        httpClient.dataTask(request){(result) in
//            guard self != nil else{
//            return
//            }
            switch result {
            case .success(let data):
            guard let data = data else{
                    return
                }
                print("data : \(data)")
                do{
                    let popularDatas : [String:Any] = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                    guard let Result  = popularDatas["results"] as? [Any] else {
                        return
                    }
            self.articleDelagate?.mostPopularArticles(ArticlesMost : Result)
                }catch let err as NSError {
                    print("err : \(err.localizedDescription)")
                }
            case .failure(let error):
                print("Error in fetching Constant : \(error) ")
            }
        }
    }
    func getSearchDataReq(request : RequestProtocol){
            print("Test -> \(request)")
            httpClient.dataTask(request){(result) in
                switch result {
                case .success(let data):
                guard let data = data else{
                        return
                }
                print("data : \(data)")
                do{
                    let popularDatas : [String:Any] = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                    guard let resultResponse  = popularDatas["response"] as? [String : Any] else {
                            return
                        }
                    guard let resultArr  = resultResponse["docs"] as? [Any] else {
                        return
                    }
                print("ResultURL : \(resultArr.count)")
                self.articleDelagate?.SearchArticles(SearchDatas: resultArr)
//             self.articleDelagate?.mostPopularArticles(ArticlesMost : Result)
                }catch let err as NSError {
                        print("err : \(err.localizedDescription)")
                    }
                case .failure(let error):
                    print("Error in fetching Constant : \(error) ")
                }
            }
        }
}
