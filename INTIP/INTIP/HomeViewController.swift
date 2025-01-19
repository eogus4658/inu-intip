//
//  HomeViewController.swift
//  INTIP
//
//  Created by 이대현 on 12/7/24.
//

import UIKit
import WebKit

class HomeViewController: UIViewController {
    private var webView = WKWebView()
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupURL()
        webView.uiDelegate = self
    }
    
    private func setupURL() {
        let urlString = "https://intip.inuappcenter.kr/app/home"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

extension HomeViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "확인", style: .cancel) {
            _ in completionHandler()
        }
        
        alertController.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
