//
//  ViewControllerRoot.swift
//  KamLaxTask
//
//  Created by Ducont on 22/02/20.
//  Copyright © 2020 Ducont. All rights reserved.
//

import UIKit

class ViewControllerRoot: UIViewController {
    class func get() -> ViewControllerRoot {
        let rootView = ViewControllerRoot(nibName: "ViewControllerRoot", bundle: nil)
        print("rootView  ready")
        return rootView
    }
    //MARK:- Property Decleration
    
    @IBOutlet weak var actionSearchBtn: UIButton!
    @IBOutlet weak var actionViewdBtn: UIButton!
    @IBOutlet weak var actionSharedBtn: UIButton!
    @IBOutlet weak var actionEmailedBtn: UIButton!
    
    let detailViewModel = DetailViewModel()
     static let titles : String = "NYT"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = ViewControllerRoot.titles
        print("View loded")
//        detailViewModel.articleDelagate = self
        setUpButtonView()
        // Do any additional setup after loading the view.
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func setUpButtonView() -> Void {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.actionSearchBtn.layer.borderWidth = 2
        self.actionSearchBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.actionEmailedBtn.layer.borderWidth = 2
        self.actionEmailedBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.actionSharedBtn.layer.borderWidth = 0
        self.actionSharedBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.actionViewdBtn.layer.borderWidth = 2
        self.actionViewdBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.actionSearchBtn.tag = 1    //search
        self.actionSearchBtn.addTarget(self, action: #selector(actionCallDetailList), for: .touchUpInside)
        
        self.actionEmailedBtn.tag = 2  // Emailed
        self.actionEmailedBtn.addTarget(self, action: #selector(actionCallDetailList), for: .touchUpInside)
        
        self.actionViewdBtn.tag = 3  //Viewed
        self.actionViewdBtn.addTarget(self, action: #selector(actionCallDetailList), for: .touchUpInside)
        
        self.actionSharedBtn.tag = 4  //Shared
        self.actionSharedBtn.addTarget(self, action: #selector(actionCallDetailList), for: .touchUpInside)
        
    }
    
}
//MARK:- Action method Extensions
extension ViewControllerRoot {
    
    @objc func actionCallDetailList(sender : UIButton) -> Void {
        switch  sender.tag {
        case 1:                     //search
            print("search -> \(sender.tag)")
            //            let contact = resultFetchController!.object(at: indexPath)
            //            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            //            let nextViewController  = storyBoard.instantiateViewController(withIdentifier: "SearchViewController") as! PersonDetialViewController
            let searchArticleController = ArticleSearchController.get()
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(searchArticleController, animated: true)
                
            }
        case 2:                 //Emailed
            print("Emailed -> \(sender.tag)")
            let emailedDetailController = DetailArticleListController.get()
            DispatchQueue.main.async {
                DetailArticleListController.PopularTypes = 2
                DetailArticleListController.title = "MostEmailed"
                self.navigationController?.pushViewController(emailedDetailController, animated: true)
                
            }
        case 3:                  //Viewed
            print("Viewed -> \(sender.tag)")
            let viewedDetailController = DetailArticleListController.get()
            DispatchQueue.main.async {
                  DetailArticleListController.PopularTypes = 3
                DetailArticleListController.title = "MostViewed"
                self.navigationController?.pushViewController(viewedDetailController, animated: true)
            }
        case 4:                  //Shared
            print("Shared -> \(sender.tag)")
            let sharedDetailController = DetailArticleListController.get()
            DispatchQueue.main.async {
                  DetailArticleListController.PopularTypes = 4
                DetailArticleListController.title = "MostShared"
            self.navigationController?.pushViewController(sharedDetailController, animated: true)
            }
        default:
            print("invalid ptn click")
        }
    }
    
    
    
    
}

//MARK:- for mostViewd Articles Delegate

//extension ViewControllerRoot : PopularArticlesDelegate {
//    func mostPopularArticles(ArticlesMost : [Any]) ->Void {
//        print(ArticlesMost)
//    }
//
//}
