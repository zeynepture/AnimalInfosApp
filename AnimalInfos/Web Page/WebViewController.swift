//
//  WebViewController.swift
//  AnimalInfos
//
//  Created by Zeynep on 16.07.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlString = urlString, let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}
