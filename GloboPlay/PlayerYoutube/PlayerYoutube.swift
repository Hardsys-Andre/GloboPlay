//
//  PlayerYoutube.swift
//  GloboPlay
//
//  Created by user226298 on 1/20/23.
//

import UIKit
import WebKit

class PlayerYoutube: UIViewController, playYoutubeDelegate {

    
    func tappedPlayYoutube() {
        print("Youtube")
    }
    
    
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for:  .normal)
        button.addTarget(self, action: #selector(backButtonDetails), for: .touchUpInside)
        
        return button
    }()
    
    @objc func backButtonDetails(){
        navigationController?.popViewController(animated: true)
    }
    
    lazy var webView: WKWebView = {
        let wView = WKWebView()
        wView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return wView
    }()
    
    let detailsViewController = DetailsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewController.delegateYoutube(delegate: self)
        view.addSubview(webView)
        self.webView.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=6-vSghiy2wM")!))
        view.addSubview(backButton)
        configConstraints()
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            
            webView.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 4),
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

