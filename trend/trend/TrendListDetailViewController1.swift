//
//  TrendListDetailViewController1.swift
//  trend
//
//  Created by user on 2020/01/21.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit

class TrendListDetailViewController1: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var TableViewDetail: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return self.trenddetaillist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailcell = TableViewDetail.dequeueReusableCell(withIdentifier: "Detail", for: indexPath)as!Detail
       
                       
                 let rowData = trenddetaillist[indexPath.row]
                        
               
                    
                    detailcell.TitleLabel.text = rowData.name
                   
                   
                               
                     return detailcell
                               
     
        
        
    }
    var trenddetaillist:[Trend] = []

    var trendDetail : Trend? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

     TableViewDetail.delegate = self
        TableViewDetail.dataSource = self
        /*getTrendsTwitter()*/
        
        
        MyApi.shared.trend { result in
            
        self.trenddetaillist = result
        self.TableViewDetail.reloadData()
    }
    

        func viewDidAppear(_ animated: Bool) {
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
