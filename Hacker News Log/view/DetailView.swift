//
//  DetailView.swift
//  Hacker News Log
//
//  Created by Mufrat Karim Aritra on 10/7/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}

struct WebView: UIViewRepresentable {
    let urlString: String?
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let safeUrl = URL(string: safeString) {
                let request = URLRequest(url: safeUrl)
                uiView.load(request)
            }
        }
    }
}
