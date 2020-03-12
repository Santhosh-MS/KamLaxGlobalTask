//
//  DetailArticleListController.swift
//  KamLaxTask
//
//  Created by Ducont on 22/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import UIKit

class DetailArticleListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    static var PopularTypes : Int = 0
    static var title : String  = "Details"
    var isSearch : Bool = false
    var RecordsData : [Any] = []
    let detailViewModel = DetailViewModel()
    class func get() -> DetailArticleListController {
        let DetailListViewCtrl = DetailArticleListController(nibName: "DetailArticleListController", bundle: nil)
        print("DetailListViewCtrl  ready")
        return DetailListViewCtrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        detailViewModel.articleDelagate = self
        self.navigationItem.title = DetailArticleListController.title
        Spinner.start()
        self.tableView.register(ListTableViewCell.nib, forCellReuseIdentifier:ListTableViewCell.identifier)
        detailViewModel.setMostPopularArt(PopularType:DetailArticleListController.PopularTypes)
    }
}

extension DetailArticleListController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecordsData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell
        if isSearch {           //for search data
            guard let searchDataList : [String : Any] =  self.RecordsData[indexPath.row] as? [String : Any] else {
                    Cell?.label.text = "test Date"
                    Cell?.lblDiscription.text = "My discription of lable"
                    return Cell!
                }
            
            let strData : String = searchDataList["pub_date"] as! String
           
            
            
//            Cell?.label.text = "\(searchDataList["pub_date"] as! String)"
            Cell?.label.text = returnDate(UtcDate : strData)
            Cell?.lblDiscription.text = "\(searchDataList["snippet"] as! String)"
        }else{                  //for MostPopular data
                guard let articlesList : [String : Any] =  self.RecordsData[indexPath.row] as? [String : Any] else {
                    Cell?.label.text = "test Date"
                    Cell?.lblDiscription.text = "My discription of lable"
                    return Cell!
                }
            Cell?.label.text = "\(articlesList["published_date"] as! String)"
            Cell?.lblDiscription.text = "\(articlesList["title"] as! String)"
        }
        return Cell!
    }
}


func returnDate(UtcDate : String) -> String {
    
    let dateFormatter = ISO8601DateFormatter()
    let date = dateFormatter.date(from: UtcDate)

    let dateFormatter2 = "yyyy-MM-dd"
       let dateFormatters2 = DateFormatter()
    dateFormatters2.dateFormat = dateFormatter2
    print(dateFormatters2.string(from: date!))
  let dates = dateFormatters2.string(from: date!)
    return "\(dates)"
}
//MARK:- extension for Articles delegaet

extension DetailArticleListController : PopularArticlesDelegate{
    func mostPopularArticles(ArticlesMost: [Any]) {
         
        print("ArticlesMost : \(ArticlesMost[1])")
        if ArticlesMost.count > 0 {
            self.isSearch = false
            DispatchQueue.main.async {
                Spinner.stop()
                self.RecordsData = ArticlesMost
                self.tableView.reloadData()
            }
        }
    }
    
    func SearchArticles(SearchDatas: [Any]) {
           Spinner.stop()
        print("ArticlesMost : \(SearchDatas[1])")
        if SearchDatas.count > 0 {
             self.isSearch = true
            DispatchQueue.main.async {
                Spinner.stop()
                self.RecordsData = SearchDatas
                self.tableView.reloadData()
            }
            
        }
    }
}
