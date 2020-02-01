//
//  TwitDisplayViewController.swift
//  trend
//
//  Created by user on 2020/02/01.
//  Copyright © 2020 linc. All rights reserved.
//

import UIKit
import WebKit

class TwitDisplayViewController: UIViewController {

    @IBOutlet weak var twitWebView: WKWebView!
    var twitUrl : URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
      
        let request = URLRequest(url: twitUrl!)
        twitWebView.load(request)


     
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
