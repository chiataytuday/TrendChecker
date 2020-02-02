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
    var categories:[String] = [" # 해시태그 이슈"," # 연예 / 스포츠"," # 정치 / 사회 / 경제"," # 그 외 이슈"]
    var isLoaded:Bool = false
    var timelineData:[[Trend]] = []
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
                let dataString :String = data.name
                print(dataString)
                MyApi.shared.getTimeLine(query: dataString, completion: {text in
                    
                })
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
      


    var trendsData:[[Trend]] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
       

          MyApi.shared.getTrendsB { result in
            self.trendsData = result
           // print(self.trendsData[0])
            self.trendlist = result.map { $0.count > 0 ? $0[0] : Trend(name: "로딩 중", url: nil, query: nil, tweetVolume:  nil) }
            self.isLoaded = true
            DispatchQueue.main.async {
                                            self.TableViewMain.reloadData() //Main
                                        }
           
                             
            
          }
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "trendDetail"{
            let trendlist = sender as? [Trend]
             if trendlist != nil{
                
                    var detailController1 = segue.destination as? TrendListViewController
               
                
                detailController1?.timeLine = trendlist!
                
                let indexPathRow = TableViewMain.indexPathForSelectedRow //선택된 테이블뷰셀의 행
                detailController1?.selectRow = [(indexPathRow?.row)!] // 다음뷰로 넘길 선택된행의 값
                if detailController1 != nil {
                    print(trendlist)
                    print(indexPathRow)
                    print (detailController1?.selectRow)
                //detailController1!.trendDetail = trendlist
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


