//
//  WebView.swift
//  HKR News
//
//  Created by Hayner Esteves on 30/09/23.
//

import Foundation
import WebKit
import SwiftUI


struct WebView: UIViewRepresentable {
    
    var urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {// here we create the webview from UIKit to one in swiftUI thats why we use the type of the struct
        return WKWebView()
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
