//
//  ViewController.swift
//  PizoteExample
//
//  Created by Fernando Valverde on 9/23/20.
//

import UIKit
import Pizote
import WebKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: ForemWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.setup(navigationDelegate: self, foremWebViewDelegate: self)
        webView.load("https://fdoxyz.ngrok.io")
    }

}

extension ViewController: ForemWebViewDelegate {
    func willStartNativeVideo(playerController: AVPlayerViewController) {
        present(playerController, animated: true) {
            playerController.player?.play()
        }
    }
}

extension ViewController: WKNavigationDelegate {
    func isAuthLink(_ url: URL) -> Bool {
        return url.absoluteString.hasPrefix("https://github.com/login") || url.absoluteString.hasPrefix("https://api.twitter.com/oauth")
    }
    
    func navigationPolicy(url: URL, navigationType: WKNavigationType) -> WKNavigationActionPolicy {
        if url.host != webView.baseHost && navigationType.rawValue == 0 {
            return .cancel
        } else {
            return .allow
        }
    }
}
