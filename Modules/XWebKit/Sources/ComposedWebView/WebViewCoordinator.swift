import UIKit

import WebKit

class WebViewCoordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, UIScrollViewDelegate {

    var parent: ComposedWebView

    init(_ uiWebView: ComposedWebView) {
        self.parent = uiWebView
    }

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        return decisionHandler(.allow)
    }

    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        switch message.name {
        case "navigate": self.processNavigateBridge(message.body)
        case "imageDetail": self.preocessImageDetailBridge(message.body)
        case "back": self.processBackBridge()
        case "confirm": self.processConfirmBridge(message.body)
        default: break
        }
    }

    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }

}

extension WebViewCoordinator {

    private func processNavigateBridge(_ messageBody: Any) {
        guard let str = messageBody as? String else { return }
        self.parent.state.naviagteLink = "https://service.xquare.app"+str
        self.parent.state.isNavigated = true
    }

    private func preocessImageDetailBridge(_ messageBody: Any) {
        guard let str = messageBody as? String else { return }
        self.parent.state.images = str
            .convertToArray()
            .map { URL(string: $0)! }
        self.parent.state.isImageViewerPresented = true
    }

    private func processBackBridge() {
        self.parent.state.isNavigated = false
    }

    private func processConfirmBridge(_ messageBody: Any) {
        guard let str = messageBody as? String else { return }
        let data = str.convertToDictionary()
        self.parent.state.alertMessage = data["message"] ?? ""
        self.parent.state.alertConfirmText = data["confirmText"] ?? ""
        self.parent.state.alertCancelText = data["cancelText"] ?? ""
        self.parent.state.isAlertPresented = true
    }

}

fileprivate extension String {

    func convertToDictionary() -> [String: String] {
        guard let data = self.data(using: .utf8) else { return [:] }
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] ?? [:]
        } catch {
            return [:]
        }
    }

    func convertToArray() -> [String] {
        return self
            .removeQuotationMarks()
            .components(separatedBy: ", ")
            .map { $0.removeQuotationMarks() }
    }

    func removeQuotationMarks() -> String {
        var result = self
        result.removeFirst()
        result.removeLast()
        return result
    }

}
