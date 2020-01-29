//
//  TwitterResponse.swift
//  trend
//
//  Created by apple153 on 24/01/2020.
//  Copyright © 2020 linc. All rights reserved.
//

import Foundation

struct TwitterResponse: Codable {
    var trends: [Trend]
}
