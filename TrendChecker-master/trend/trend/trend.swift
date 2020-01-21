//
//  trend.swift
//  trend
//
//  Created by linc on 2020/01/06.
//  Copyright © 2020 linc. All rights reserved.
//

import Foundation

class selectKeyword//기사로 찾아볼 키워드를 결정할 class
{
    var wholeNewsTitle : Array<String>  = []//기사의 제목을 받아올 array
    
    func wholeKewords(){ //기사마다 키워드를 추출할 함수
        
    }
    
    func selectKeywords(){  //위에서 추출한 키워드 중에서 제일 많이 언급된 키워드 선정
        
    }
}

class getNews{//신문사의 기사의 제목, 본문 일부, 날짜를 가져오는 class
    var title : Array<String>  = []
    var article: Array<String>  = []
    var date : Array<String>  = []
    
    func getTitle(){ //기사의 제목을 가져올 함수
        
    }
    func getArticle(){ //기사의 본문을 가져올 함수
           
       }
    func getDate(){ //기사의 날짜를 가져올 함수
           
       }
}

class Josun : getNews//각 신문사별 기사의 제목, 본문 일부, 날짜를 가져오는 class
{
}
class Jongang : getNews//각 신문사별 기사의 제목, 본문 일부, 날짜를 가져오는 class
{
}
class Hangurae : getNews//각 신문사별 기사의 제목, 본문 일부, 날짜를 가져오는 class
{
}
class Guenhang : getNews//각 신문사별 기사의 제목, 본문 일부, 날짜를 가져오는 class
{
}


