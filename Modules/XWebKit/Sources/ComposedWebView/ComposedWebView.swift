import UIKit
import SwiftUI

import WebKit
import RxCocoa
import RxSwift
import Combine

struct ComposedWebView: UIViewRepresentable {

    @ObservedObject var state: XWebKitState

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {

        let webView = WKWebView(frame: CGRect.zero, configuration: generateWKWebViewConfiguration())
        webView.navigationDelegate = context.coordinator
        webView.scrollView.delegate = context.coordinator
        self.setLoadingProgress(webView: webView)
        self.setEvaluateJavaScript(webView: webView)

        if let url = URL(string: self.state.urlString) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }

        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) { }

}

extension ComposedWebView {

    private func generateWKWebViewConfiguration() -> WKWebViewConfiguration {

        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false

        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences

        self.setWebCookie(cookie: [
            "accessToken": self.state.accessToken
        ], configuration: configuration)

        self.registerBridge(name: [
            "navigate",
            "imageDetail",
            "back",
            "confirm",
            "error",
            "photoPicker",
            "actionSheet"
        ], configuration: configuration)

        return configuration
    }

    private func setWebCookie(cookie: [String: String], configuration: WKWebViewConfiguration) {
        let dataStore = WKWebsiteDataStore.nonPersistent()
        cookie.forEach {
            dataStore.httpCookieStore.setCookie(HTTPCookie(properties: [
                .domain: ".xquare.app",
                .path: "/",
                .name: $0.key,
                .value: $0.value,
                .secure: "TRUE",
                HTTPCookiePropertyKey("HttpOnly"): true
            ])!)
        }
        configuration.websiteDataStore = dataStore
    }

    private func registerBridge(name: [String], configuration: WKWebViewConfiguration) {
        name.forEach {
            configuration.userContentController.add(self.makeCoordinator(), name: $0)
        }
    }
}

extension ComposedWebView {

    private func setEvaluateJavaScript(webView: WKWebView) {

        self.state.$alertResponse
            .compactMap { $0 }
            .sink {
                self.evaluateJavaScript(webView: webView, bridgeName: "confirm", data: "{ success: \($0) }")
            }
            .store(in: &self.state.cancellables)

        self.state.$selectedImages
            .map { $0.map {
                guard let jpegData = $0.jpegData(compressionQuality: 1) else { return "" }
                return jpegData.base64EncodedString()
            }}
            .sink {
                self.evaluateJavaScript(webView: webView, bridgeName: "photoPicker", data: "{ photos: \($0) }")
            }
            .store(in: &self.state.cancellables)

        self.state.$selectedActionSheetItemIndex
            .compactMap { $0 }
            .sink {
                self.evaluateJavaScript(webView: webView, bridgeName: "actionSheet", data: "{ index: \($0) }")
            }
            .store(in: &self.state.cancellables)

    }

    private func evaluateJavaScript(webView: WKWebView, bridgeName: String, data: String) {
        DispatchQueue.main.async {
            webView.evaluateJavaScript("""
            window.dispatchEvent(new CustomEvent('\(bridgeName)XBridge', {
                detail: \(data)
            }));
            """)
        }
    }

    private func setLoadingProgress(webView: WKWebView) {
        Task {
            let progress = webView.rx.estimatedProgress.values
            for try await now in progress {
                self.state.loadingProgress = now
            }
        }
    }

}
