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
import CoreML
import NaturalLanguage

class MyApi: NSObject {
    static let shared = MyApi()
   
    private var oauthswift = OAuth1Swift(
        consumerKey:    "G2DeDOSi7dThLsqA6oApmHJ1U",
        consumerSecret: "pUfRALnc9OkVhUNo0urpicwkM5LZ8D0r8wUxIeXXLmwuLKh9SH"
    )
    
    func getTimeLine(query:String, completion: @escaping ([Text]) -> Void) {//트윗 타임라인 가져옴
        //
        var escapedString = query.stringByAddingPercentEncodingForRFC3986()
        oauthswift.client.get("https://api.twitter.com/1.1/search/tweets.json?q=\(escapedString ?? "")") { result in
                   switch result {
                   case .success(let response):
                    //print(response.dataString(encoding: .utf8))
                       let decoder = JSONDecoder()
                    
                        if let decoded = try? decoder.decode(TextResponse.self, from: response.data) {
                            var result:[Text] = decoded.statuses
                            
                            completion(result)
                            
                       }
                   case .failure(let error):
                      print(error)
                   }
        }
    }
   
    func getTrend(completion: @escaping ([Trend]) -> Void) {//트위터 트랜드 가져오기
        oauthswift.client.get("https://api.twitter.com/1.1/trends/place.json?id=23424868") { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                
                var nameArr = [String]()
                if let decoded = try? decoder.decode(Array<TwitterResponse>.self, from: response.data) {
                    var trends = decoded.first?.trends ?? []
                    var result:[Trend] = []//트위터 트랜드를 가져옴
                    
                   /* for index in 0..<result.count{//nameArr에 트랜드 키워드 저장
                        nameArr.append(result[index].name)
                        print(result[index].tweetVolume)
                        
                    }*/
                    completion(trends)
                    
              /*      for trend in trends {
                        self.getTimeLine(query: trend.name, completion: { text in
                            let tr = Trend(name: "a", url: "b", query: "c", tweetVolume: 3)
                            result.append(tr)
                            if result.count == trends.count {
                                // 임시 데이터
                                var example : [Trend] = []
                                for index in 0...3{
                                    example.append(result[index])
                                }
                                
                                completion(example)
                            }
                        })
                    }*/
                    
                }
            case .failure(let error):
               print(error)
            }
        }
    
    }
    
    
    func getTrendsB(completion: @escaping ([[Trend]]) -> Void) {
        var result: [Trend] = []
        
        var checkField:[String: [Trend]] = [
            "해시태그 이슈": [],
            "연애": [],
            "정치 사회": [],
            "기타": []
        ]
    
        self.getTrend(completion: { rawTrends in
            var count = 0
            for trend in rawTrends {
                self.getTimeLine(query: trend.name, completion: { texts in
                    if trend.name.contains("#") {
                        checkField["해시태그 이슈"]?.append(trend)
                    } else {
                        let mlResult = self.classifyTrend(trend: trend.name, timeline: texts)
                        checkField[mlResult]?.append(trend)
                    }
                    
                    if count == rawTrends.count - 1 {
                        completion([
                            checkField["해시태그 이슈"]!,
                            checkField["연애"]!,
                            checkField["정치 사회"]!,
                            checkField["기타"]!
                        ])
                    } else {
                        completion([
                            checkField["해시태그 이슈"]!,
                            checkField["연애"]!,
                            checkField["정치 사회"]!,
                            checkField["기타"]!
                        ])
                        print(count)
                        count += 1
                    }
                })
            }
        })
    }

    func classifyTrend(trend:String, timeline:[Text]) -> String{//카테고리별로 트랜드를 분류
        var result = ""
        var naturalTrend = trend
        for index in 0..<timeline.count{
            naturalTrend.append(timeline[index].text)
        }
        
        let model = TrendChecker().model
            
        do {
            let sentimentPredictor = try NLModel(mlModel: model)
            let predictions = sentimentPredictor.predictedLabel(for: naturalTrend)
            result = predictions ?? ""
        } catch {
            print(error)
        }
        return result
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
