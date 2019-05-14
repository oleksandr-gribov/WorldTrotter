//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Oleksandr Gribov on 8/23/18.
//  Copyright © 2018 Oleksandr Gribov. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKUIDelegate {
    
    var webView : WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "www.bignerdranch.com ")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
}
