//
//  ViewController2.swift
//  trend
//
//  Created by apple153 on 28/01/2020.
//  Copyright © 2020 linc. All rights reserved.
//


import UIKit
import CoreML
import NaturalLanguage

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var testText = "아이유"
        
        let model = TrendChecker().model
        
        do {
            let sentimentPredictor = try NLModel(mlModel: model)
            let predictions = sentimentPredictor.predictedLabel(for: testText)
            print(predictions)
        } catch {
            print(error)
            
        }
        
    }


}
