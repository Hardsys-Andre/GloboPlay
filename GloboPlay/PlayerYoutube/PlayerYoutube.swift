//
//  PlayerYoutube.swift
//  GloboPlay
//
//  Created by user226298 on 1/20/23.
//

import UIKit
import WebKit

class PlayerYoutube: UIViewController{
    
    lazy var webView: WKWebView = {
        let wView = WKWebView()
        wView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return wView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        self.webView.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=cUuxbzyafS8")!))
        configConstraints()
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

