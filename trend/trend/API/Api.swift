//
//  Api.swift
//  TableViewEx
//
//  Created by KANG HEE JONG on 2020/01/14.
//  Copyright © 2020 KANG HEE JONG. All rights reserved.
//

import Foundation
import Alamofire
import OAuthSwift

class MyApi: NSObject {
    static let shared = MyApi()
   
    private var oauthswift = OAuth1Swift(
        consumerKey:    "G2DeDOSi7dThLsqA6oApmHJ1U",
        consumerSecret: "pUfRALnc9OkVhUNo0urpicwkM5LZ8D0r8wUxIeXXLmwuLKh9SH"
    )
   
    func trend(completion: @escaping (String?) -> Void) {
        oauthswift.client.get("https://api.twitter.com/1.1/trends/place.json?id=23424868") { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                
                if let decoded = try? decoder.decode(Array<TwitterResponse>.self, from: response.data) {
                    var result:[Trend] = decoded.first?.trends ?? []
                    print(result)
                }
               
//                completion(_response)
            case .failure(let error):
               print(error)
            }
        }
    
    }

}

