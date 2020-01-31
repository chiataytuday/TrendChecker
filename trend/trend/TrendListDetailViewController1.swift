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
    
    @IBOutlet weak var CurrentTime2: UILabel!
    let timeSelector : Selector = #selector(TrendListDetailViewController1.updateTime)
         let interval = 1.0 // 타이머 간격. 1초
         var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
      
        @objc func updateTime(){
               // count 값을 문자열로 변환하여 lblCurrentTime.text에 출력
       //        lblCurrentTime.text = String(count)
       //        count = count + 1 // count 값을 1 증가
               let date = NSDate() // 현재 시간을 가져옴
               
               
               let formatter = DateFormatter() // DateFormatter라는 클래스의 상수 formatter를 선언
               
               formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEEE"
               // 상수 formatter의 dateFormat 속성을 설정
               // 현재날짜(date)를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열(String)로 변환
            CurrentTime2.text = "현재시간 : "+formatter.string(from: date as Date)
           
       }
    
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
