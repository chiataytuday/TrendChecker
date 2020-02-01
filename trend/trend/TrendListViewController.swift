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

    var trendDetail : Trend? = nil
    
    var hashtag:[Trend] = []
    var entertain:[Trend] = []
    var polictics:[Trend] = []
    var etc:[Trend] = []
    
    override func viewDidLoad() {
       super.viewDidLoad()

       tableViewDetail.delegate = self
       tableViewDetail.dataSource = self
     

        MyApi.shared.getTrendsB{ result in
            self.hashtag = result[0]
            self.entertain = result[1]
            self.polictics = result[2]
            self.etc = result[3]

            
         //  self.trenddetaillist = result
           self.tableViewDetail.reloadData()
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
        let codersHighURL = URL(string: "http://www.apple.com")
        destination.twitUrl = codersHighURL
        
        
        
    }

}
    

