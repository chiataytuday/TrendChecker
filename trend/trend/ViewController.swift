//
//  ViewController.swift
//  trend
//
//  Created by linc on 2020/01/06.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        /*getTrendsTwitter()*/
        
        
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
    
    /*@IBOutlet weak var CurrentTime: UILabel!
    let timeSelector : Selector = #selector(ViewController.updateTime)
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
         CurrentTime.text = "현재시간 : "+formatter.string(from: date as Date)
        
    }*/
    
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
    
 
    /*func nowTime(_ tableView: UITableView){
        let label = UILabel()
               // 기본 셋팅
               label.frame.size = CGSize(width: 50, height: 20)
               label.text = "Hello, world"
               label.textColor = .black
               label.center = self.view.center

               // 태그 지정
               label.tag = 1 // 중요 **
               let now=NSDate()
               let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
               label.text=dateFormatter.string(from: now as Date)

               // 화면에 추가
               self.view.addSubview(label)
    }*/
    
}


