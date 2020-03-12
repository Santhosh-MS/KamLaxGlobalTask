//
//  ArticleSearchController.swift
//  KamLaxTask
//
//  Created by Ducont on 22/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import UIKit

class ArticleSearchController: UIViewController {

    var querySearch : String = ""
    @IBOutlet weak var searchBar: UISearchBar!
    class func get() -> ArticleSearchController {
        let articleViewCtrl = ArticleSearchController(nibName: "ArticleSearchController", bundle: nil)
        print("articleViewCtrl  ready")
        return articleViewCtrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search"
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func actionSearch(_ sender: Any) {
        let viewedDetailController = DetailArticleListController.get()
        if self.querySearch.count > 0 {
            
            Constants.Service.SearchURL = "search/v2/articlesearch.json?q=\(self.querySearch)&"
            DispatchQueue.main.async {
            DetailArticleListController.PopularTypes = 0
            DetailArticleListController.title = "SeachedItems"
        self.navigationController?.pushViewController(viewedDetailController, animated: true)
               }
        }else{
            print("Search Bar is empty....")
        }
    }

}

//MARK:- searchView delegate
extension ArticleSearchController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        print("searchText -> \(searchText)")
        self.querySearch = searchText
    }
    
}
