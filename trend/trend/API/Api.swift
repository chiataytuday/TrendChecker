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
    
    func tweet(query:String, completion: @escaping () -> Void) {//트윗 타임라인 가져옴
        //
        var escapedString = query.stringByAddingPercentEncodingForRFC3986()
        oauthswift.client.get("https://api.twitter.com/1.1/search/tweets.json?q=\(escapedString ?? "")") { result in
                   switch result {
                   case .success(let response):
                    //print(response.dataString(encoding: .utf8))
                       let decoder = JSONDecoder()
                    
                        if let decoded = try? decoder.decode(TextResponse.self, from: response.data) {
                            var result:[Text] = decoded.statuses
                            print(result)
                            
                       }
                   case .failure(let error):
                      print(error)
                   }
               }
    }
   
    func trend(completion: @escaping ([Trend]) -> Void) {
        oauthswift.client.get("https://api.twitter.com/1.1/trends/place.json?id=23424868") { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                
                var nameArr = [String]()
                if let decoded = try? decoder.decode(Array<TwitterResponse>.self, from: response.data) {
                    var result:[Trend] = decoded.first?.trends ?? []
                    
                    for index in 0..<result.count{//nameArr에 트랜드 키워드 저장
                        nameArr.append(result[index].name)
                    }
                    //print(result)
                    completion(result)
                    
                }
            case .failure(let error):
               print(error)
            }
        }
    
    }

}

extension String {
  func stringByAddingPercentEncodingForRFC3986() -> String? {
    let unreserved = "-._~/?"
    let allowed = NSMutableCharacterSet.alphanumeric()
    allowed.addCharacters(in: unreserved)
    return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
  }
}
