//
//  WebkitViewController.swift
//  WorldTrotter
//
//  Created by Riley, Kyle M on 2/12/20.
//  Copyright © 2020 Riley, Kyle M. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.bignerdranch.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
