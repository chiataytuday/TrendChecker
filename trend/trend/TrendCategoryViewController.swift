//
//  ViewController.swift
//  trend
//
//  Created by linc on 2020/01/06.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit
class TrendCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var TableViewMain: UITableView!
    
    var trendlist:[Trend] = []
    var categories:[String] = ["# 해시태그 이슈","# 정치/사회/경제","# 연예/스포츠","# 그외 이슈"]
    var isLoaded:Bool = false
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isLoaded {
            if indexPath.row % 2 == 0 { // 짝수
                let categorycell = TableViewMain.dequeueReusableCell(withIdentifier: "Category", for: indexPath) as! Category
                categorycell.CategoryNameLabel.text = self.categories[Int(indexPath.row / 2)]
                return categorycell
            } else { // 홀수
                let allcell = TableViewMain.dequeueReusableCell(withIdentifier: "All", for: indexPath) as! All
                let data = self.trendlist[Int(((indexPath.row + 1) / 2)-1)]
                allcell.AllLabel.text = data.name
                allcell.contentLabel.text = data.name
                allcell.VolumeLabel.text = String(data.tweetVolume ?? 0)+"트윗"
                          
                return allcell
            }
        } else {
            let categorycell = TableViewMain.dequeueReusableCell(withIdentifier: "Category", for: indexPath) as! Category
            categorycell.CategoryNameLabel.text = self.categories[indexPath.row]
            return categorycell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoaded {
            return self.trendlist.count + self.categories.count
            
        } else {
            return self.categories.count
        }
    }
      
<<<<<<< HEAD:trend/trend/TrendCategoryViewController.swift
   
=======
   /* func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "TrendListDetailViewController1")as!TrendListDetailViewController1
    }*/
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "trendDetail"{
            let
        }
    }*/
    var trendsData:[[Trend]] = []
    
>>>>>>> 55d770a3564a14484dc4689d7783f7b7c9ba1b5b:trend/trend/ViewController.swift
    override func viewDidLoad() {
        super.viewDidLoad()
      
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
       
        
        var printResult:[Trend] = []
          var hashtag: [Trend] = []

          MyApi.shared.getTrendsB { result in
            self.trendsData = result
            self.trendlist = result.map { $0.count > 0 ? $0[0] : Trend(name: "로딩 중", url: nil, query: nil, tweetVolume:  nil) }
            self.isLoaded = true
            self.TableViewMain.reloadData()
//              print(result)
//              printResult = result
//
//              printResult = result.filter { !$0.name.hasPrefix("#") }//해시태그 이슈 제외
//              hashtag = result.filter { $0.name.hasPrefix("#") }
//
//              print(printResult)
//              print(hashtag)
//
//              MyApi.shared.getTimeLine(query: "\(printResult[0].name)", completion: {_ in
          }
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "trendDetail"{
            let trendlist = sender as? [Trend]
            if trendlist != nil{
                let detailController1 = segue.destination as? TrendListDetailViewController1
                if detailController1 != nil {
                    print(trendlist)
//                    detailController1!.trendDetail = trendlist
                }
            }
        }
    }


        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row % 2 == 1 {
                performSegue(withIdentifier: "trendDetail", sender: self.trendsData[Int(indexPath.row/2)])
            }
        }
    
 
    
}


