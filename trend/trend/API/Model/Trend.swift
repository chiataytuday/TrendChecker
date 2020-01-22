//
//  Trend.swift
//  trend
//
//  Created by apple153 on 22/01/2020.
//  Copyright © 2020 linc. All rights reserved.
//

import Foundation

struct Trend: Codable {
    var name: String
    var url: String
    var query: String
    var tweetVolume: Int?
    
    enum CodingKeys : String, CodingKey {
        case name
        case url
        case query
        case tweetVolume = "tweet_volume"
    }
}
