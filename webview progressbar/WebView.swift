//
//  WebView.swift
//  webview progressbar
//
//  Created by Edo Lorenza on 15/04/24.
//

import SwiftUI
import WebKit

public struct WebView: UIViewRepresentable {
    public typealias UIViewType = WKWebView
    var urlToDisplay: URL?
    @Binding public var isLoading: Bool
    @Binding public var progress: Double
    
    public init(urlToDisplay: String, isLoading: Binding<Bool>, progress: Binding<Double>) {
        self.urlToDisplay = URL(string: urlToDisplay)
        self._isLoading = isLoading
        self._progress = progress
    }
    
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        if let urlWeb = urlToDisplay {
            let request = URLRequest(url:urlWeb)
            webView.load(request)
        }
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        return webView
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self, isLoading: $isLoading)
    }
    
   
    public class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        @Binding var isLoading: Bool
        
        public init(_ parent: WebView, isLoading: Binding<Bool>) {
            self._isLoading = isLoading
            self.parent = parent
        }
        
        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            isLoading = true
        }
        
        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isLoading = false
            }
            parent.progress = 1.0
        }
        
        public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            parent.progress = Double(webView.estimatedProgress)
        }
    }
    
    public func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
}
