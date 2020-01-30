//
//  ViewController.swift
//  trend
//
//  Created by linc on 2020/01/06.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
 
   /*  func getTrendTwitter() {
          let task = URLSession.shared.dataTask(with: URL(string: "")!) { (data, response, error) in
              
              if let dataJson = data {
                   
                
                  do {
                      let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
               
                     
                      let name = json["name"] as!Array<Dictionary<String, Any>>
                      self.trendJson = name
                      
                      DispatchQueue.main.async {
                          self.TableViewMain.reloadData() //
                      }
                     

                  }
                  catch {}
              }
             
          }
          
          task.resume()
      }
   */
@IBOutlet weak var TableViewMain: UITableView!
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {

        let categorycell = TableViewMain.dequeueReusableCell(withIdentifier: "Category", for: indexPath) as! Category
            
        if indexPath.row == 0 {
                categorycell.CategoryNameLabel.text = "# 해시태그 이슈"
            }
        if indexPath.row == 2 {
                           categorycell.CategoryNameLabel.text = "# 정치/사회/경제"
                       }
        if indexPath.row == 4 {
                                            categorycell.CategoryNameLabel.text = "#연예/스포츠"
                                        }
        if indexPath.row == 6{
            categorycell.CategoryNameLabel.text = "# 그외 이슈"

      
            
            }
                                                                      
                                    
                   
                   
           
            
                       return categorycell
            
        } else {

                   let allcell = TableViewMain.dequeueReusableCell(withIdentifier: "All", for: indexPath) as! All
                  
            //let rowData = trendlist[indexPath.row]
                   
          
               
                //allcell.AllLabel.text = rowData.name
              
                //allcell.VolumeLabel.text = "\(rowData.tweetVolume)트윗"
                          
                return allcell
                          
            
           
            
        }
         
           
    }
   var trendlist:[Trend] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trendlist.count + 4
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        /*getTrendsTwitter()*/
        
        
        MyApi.shared.trend { result in
            
        self.trendlist = result
        self.TableViewMain.reloadData()
        }
    }
    
    @IBOutlet weak var CurrentTime: UILabel!
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
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "trendDetail"{
            let trendlist = sender as? Trend
            if trendlist != nil{
                let detailController1 = segue.destination as? TrendListDetailViewController1
                if detailController1 != nil {
                    detailController1!.trendDetail = trendlist
                }
            }
        }
    }


        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "trendDetail", sender: self.trendlist[indexPath.row])
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


