//
//  ViewController.swift
//  pra
//
//  Created by user on 2020/01/17.
//  Copyright © 2020 dd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableViewMain: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath)as!Type1
        cell.TextLabel.text = "\(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         
    }
    func getnews() {
        let task = URLSession.shared.dataTask(with: URL(string:"https://newsapi.org/v2/top-headlines?country=kr&apiKey=3d34e0ebe7c34661bd8f98e8222b917f")!) { (data, response, error) in
        
            if let dataJson = data {
            
        
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as!  Dictionary<String, Any>
                    let articles = json["articles"] as!Array<Dictionary<String,Any>>
                    print(articles)
                    for (idx, value) in articles.enumerated() {
                        if let v = value as? Dictionary<String,Any> {
                            print("\(v["title"])")
                        }
                    }
                    
                    
              
            }
                catch{}
            }
        }
        task.resume()
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        getnews()
        // Do any additional setup after loading the view.
    }


}

