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

        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false

        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        self.registerBridge(configuration: configuration)

        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.scrollView.delegate = context.coordinator
        self.setLoadingProgress(webView: webView)
        self.setEvaluateJavaScript(webView: webView)

        if let url = URL(string: self.state.urlString) {
            var urlRequest = URLRequest(url: url)
            urlRequest.addValue("Bearer \(self.state.accessToken)", forHTTPHeaderField: "Authorization")
            webView.load(urlRequest)
        }

        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) { }

}

extension ComposedWebView {

    private func registerBridge(configuration: WKWebViewConfiguration) {
        configuration.userContentController.add(self.makeCoordinator(), name: "navigate")
        configuration.userContentController.add(self.makeCoordinator(), name: "imageDetail")
        configuration.userContentController.add(self.makeCoordinator(), name: "back")
        configuration.userContentController.add(self.makeCoordinator(), name: "confirm")
        configuration.userContentController.add(self.makeCoordinator(), name: "error")
    }

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
