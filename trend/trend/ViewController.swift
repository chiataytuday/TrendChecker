//
//  ViewController.swift
//  trend
//
//  Created by linc on 2020/01/06.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit
struct HashTagList {
    var title : String
    var tweet : Int
    }
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
        let societycell = TableViewMain.dequeueReusableCell(withIdentifier: "Society", for: indexPath) as!Society
        let sportcell = TableViewMain.dequeueReusableCell(withIdentifier: "Sports", for: indexPath)
                   as!Sports
        let etccell = TableViewMain.dequeueReusableCell(withIdentifier: "Etc", for: indexPath)as!Etc
    allcell.AllLabel.text = "(#아무노래 챌린지)"
     societycell.SocietyLabel.text = "(#조국)"
     sportcell.SportsLabel.text = "(#류현진)"
       etccell.EtcLabel.text = "(#애쉬골드)"
       
     return societycell 
            
      
         
           
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 3
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
    }
  
    

}

