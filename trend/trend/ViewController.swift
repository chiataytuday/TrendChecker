//
//  ViewController.swift
//  trend
//
//  Created by linc on 2020/01/06.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var trendJson : Array<Dictionary<String, Any>> = []
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
        
        let allcell = TableViewMain.dequeueReusableCell(withIdentifier: "All", for: indexPath) as!All
       
        let rowData = self.trendlist[indexPath.row]
        
        allcell.AllLabel.text = rowData.name
        
        allcell.VolumeLabel.text = "트윗"
 
            return allcell
         
           
    }
    let trendlist:[Trend] = [

        Trend(name:"#해시태그 이슈"),
        Trend(name:"#아무노래챌린지"),
        Trend(name:"#정치/사회/경제"),
        Trend(name:"#이국종"),
        Trend(name:"#연애/스포츠"),
        Trend(name:"#박보영"),
       // Trend(name:
        
    
    
    
    
    

        Trend(name:"#해시태그이슈"),
        Trend(name:"#아무노래챌린지")

    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trendlist.count
      }
      
    /*func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }*/
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "trendDetail"{
            let
        }
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        /*getTrendsTwitter()*/
        
        
        MyApi.shared.trend { result in
        print(result)
    }
  
       
    
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
    
    func nowTime(_ tableView: UITableView){
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
    }
    
}


