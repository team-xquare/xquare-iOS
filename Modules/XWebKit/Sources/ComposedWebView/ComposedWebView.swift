import UIKit
import SwiftUI

import WebKit
import RxCocoa
import RxSwift

struct ComposedWebView: UIViewRepresentable {

    @ObservedObject var state: XWebKitState
    var disposeBag = DisposeBag()

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
            "error"
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
        self.state.alertResponse.subscribe(onNext: {
            self.evaluateJavaScript(webView: webView, bridgeName: "confirm", data: "{ success: \(String($0)) }")
        }).disposed(by: self.disposeBag)
    }

    private func evaluateJavaScript(webView: WKWebView, bridgeName: String, data: String) {
        webView.evaluateJavaScript("""
        window.dispatchEvent(new CustomEvent('\(bridgeName)XBridge', {
            detail: \(data)
        }));
        """)
    }

    private func setLoadingProgress(webView: WKWebView) {
        webView.rx.estimatedProgress
            .subscribe(onNext: {
                self.state.loadingProgress = $0
            })
            .disposed(by: self.disposeBag)
    }

}
