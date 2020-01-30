//
//  Text.swift
//  trend
//
//  Created by apple153 on 30/01/2020.
//  Copyright © 2020 linc. All rights reserved.
//

import Foundation

struct Text: Codable{
    var text : String
    
    enum CodingKeys : String, CodingKey {
        case text
    }
}
