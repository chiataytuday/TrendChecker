//
//  Api.swift
//  TableViewEx
//
//  Created by KANG HEE JONG on 2020/01/14.
//  Copyright © 2020 KANG HEE JONG. All rights reserved.
//

import Foundation
import Alamofire

class MyApi: NSObject {
    static let shared = MyApi()
    
    private let authorization = """
    OAuth oauth_consumer_key="G2DeDOSi7dThLsqA6oApmHJ1U",oauth_token="1218733691335135234-HuJdXlOoWvmx8AcJ3oLLmVpJKbrXJy",oauth_signature_method="HMAC-SHA1",oauth_timestamp="1579667447",oauth_nonce="GBn8wz10ImE",oauth_version="1.0",oauth_signature="ekowH5NlLYAnMWtV%2BLJlYigFdnU%3D"
    """
    
    func trend(completion: @escaping ([Trend]) -> Void) {
        Alamofire.request("https://api.twitter.com/1.1/trends/place.json", method: .get, parameters: ["id": 23424868], headers: ["Authorization": authorization]).responseData(completionHandler: { response in
            switch response.result {
            case .success(let data):
                print(data)
                let result = [
                    Trend(name: "a", url: "http://", query: "a", tweetVolume: 100),
                    Trend(name: "b", url: "http://", query: "a", tweetVolume: 100),
                    Trend(name: "c", url: "http://", query: "a", tweetVolume: 100),
                    Trend(name: "d", url: "http://", query: "a", tweetVolume: 100)
                ]
                completion(result)
            case .failure(let error):
                print(error)
            }
            
        })
        
    }
}

