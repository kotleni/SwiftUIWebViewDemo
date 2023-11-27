//
//  ContentView.swift
//  WebViewDemo
//
//  Created by Victor Varenik on 27.11.2023.
//

import SwiftUI
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.ignoresViewportScaleLimits = true
        webConfiguration.suppressesIncrementalRendering = true
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsAirPlayForMediaPlayback = false
        webConfiguration.allowsPictureInPictureMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webConfiguration.requiresUserActionForMediaPlayback = false
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        //webView.navigationDelegate = self
        webView.sizeToFit()
        webView.isOpaque = false
        view = webView
    }
}

struct WebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> WebViewController {
        return WebViewController()
    }
    
    func updateUIViewController(_ webViewController: WebViewController, context: Context) {
        let request = URLRequest(url: url)
        webViewController.webView.load(request)
    }
}

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://google.com")!)
    }
}

//#Preview {
//    ContentView()
//}
