//
//  WebViewController.swift
//  ecommerce
//
//  Created by Baton Ferri on 5/17/21.
//  Copyright © 2021 Student 08. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var indView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWeb()
        indView.startAnimating()
        loadPage()
        // Do any additional setup after loading the view.
    }
    

    func loadPage(){
          let url = URL(string: "https://shopify.com")
          let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
        
      }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indView.isHidden = true
    }

    func setupWeb(){
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }

}
