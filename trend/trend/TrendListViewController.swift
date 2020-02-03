//
//  TrendListDetailViewController1.swift
//  trend
//
//  Created by user on 2020/01/21.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit
import SafariServices




class TrendListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewDetail: UITableView!
    
    var trenddetaillist:[Trend] = []
    var selectRow:[Int] = []
    var trendDetail : Trend? = nil
    var timelineData:[[Trend]] = []
    
    var timeLine : [Trend] = []
  
    
    override func viewDidLoad() {
       super.viewDidLoad()

       tableViewDetail.delegate = self
       tableViewDetail.dataSource = self
     
        
        MyApi.shared.getTrendsB{ result in
          self.timelineData = result
         
            print(self.timeLine)
            
            self.trenddetaillist = self.timeLine
           /* if self.selectRow == [1] {
                self.trenddetaillist = result[0]
              
            }
            else if self.selectRow == [3]{
                                    self.trenddetaillist = result[1]
                                    
            }
            else if self.selectRow == [5]{
                                    self.trenddetaillist = result[2]
                                 
            }
            else if  self.selectRow == [7] {
                                    self.trenddetaillist = result[3]
                                   
            }*/
                                

             DispatchQueue.main.async {
                                self.tableViewDetail.reloadData() //Main
                            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
   
   }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return self.trenddetaillist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailcell = tableViewDetail.dequeueReusableCell(withIdentifier: "Detail", for: indexPath)as!Detail
       
         let rowData = trenddetaillist[indexPath.row]
                
        detailcell.TitleLabel.text = rowData.name
        detailcell.VolumeLabel2.text = String(self.trenddetaillist[Int(indexPath.row)].tweetVolume ?? 0)+"트윗"
            
                       
             return detailcell
                               
     
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! TwitDisplayViewController
        
        let tweetUrl = URL(string:"")
        destination.twitUrl = tweetUrl
        
       
    }

}
    


