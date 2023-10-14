//
//  WebPageViewController.swift
//  News App
//
//  Created by jaiprakash sharma on 14/10/23.
//

import UIKit
import WebKit

class WebPageViewController:UIViewController, WKNavigationDelegate ,WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url:String?
    var retriveTitle = false
    var allowUrlVisits = true
    
    static func newInstance() -> WebPageViewController{
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let webPage = mainStoryBoard.instantiateViewController(withIdentifier: "ID_WebPageVC") as! WebPageViewController
        return webPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.navigationDelegate = self
        webView.uiDelegate = self
        if let url = self.url {
            
            let urlRequest = URLRequest(url: URL(string: url)!)
            self.webView.load(urlRequest)
            webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        }
        
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if retriveTitle {
            self.title = webView.title
        }
    }
    
    
    
}
