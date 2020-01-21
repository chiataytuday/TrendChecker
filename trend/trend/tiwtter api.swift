//
//  tiwtter api.swift
//  trend
//
//  Created by user on 2020/01/21.
//  Copyright © 2020 linc. All rights reserved.
//

import Foundation

let FullPath = "/Users/apple153/Documents/twitter_ex.json"
var trendJson = String : Any;
func getTrendsTwitter(){
    do{
        if let data = try String(contentsOfFile: FullPath).data(using: .utf8) {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
        trendJson = json;
        } }catch{
            print("json 에러")
    }
}
func parseTrends(){
if let trends = trendJson["trends"] as? [[String : Any]]{
    for trendsIndex in trends{
        name = (trendsIndex["name"] as! String)
        url = (trendsIndex["url"] as! String)
        //promoted_content.append(trendsIndex["promoted_content"] as! String)
        query = (trendsIndex["query"] as! String)
        tweet_volume = (trendsIndex["tweet_volume"] as! Int)
    }
    }
}
{
"trends": [
{
"name": "#ChainedToTheRhythm",
"url": "http://twitter.com/search?q=%23ChainedToTheRhythm",
"promoted_content": null,
"query": "%23ChainedToTheRhythm",
"tweet_volume": 48857
},
{
"name": "George Lopez",
"url": "http://twitter.com/search?q=%22George+Lopez%22",
"promoted_content": null,
"query": "%22George+Lopez%22",
"tweet_volume": 90590
}
]
}
