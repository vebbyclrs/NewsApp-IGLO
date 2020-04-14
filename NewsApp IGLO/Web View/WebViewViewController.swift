//
//  WebViewViewController.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 15/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import WebKit

class WebViewViewController: UIViewController {
    var url : URL?
    
    lazy var webView : WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        guard let url = url else {
            let alert = UIAlertController(title: "URL not found", message: "There's no URL found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true) {
                
            }
            return
        }
        webView.load(URLRequest(url: url))
        
    }
    
    func initView() {
        view.addSubview(webView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    

}
