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
        case "error": self.processErrorBridge(message.body)
        case "photoPicker": self.processPhotoPickerBridge()
        case "actionSheet": self.processActionSheetBridge(message.body)
        default: break
        }
    }

    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }

}

extension WebViewCoordinator {

    private func processNavigateBridge(_ messageBody: Any) {
        guard let messageBodyAsString = messageBody as? String else { return }
        let messageBodyAsDictionary = messageBodyAsString.convertToDictionary()
        self.parent.state.naviagteLink = parent.state.urlString+(messageBodyAsDictionary["url"] ?? "")
        self.parent.state.naviagteTitle = messageBodyAsDictionary["title"] ?? ""
        self.parent.state.needsToNavigate = true
    }

    private func preocessImageDetailBridge(_ messageBody: Any) {
        guard let messageBodyAsString = messageBody as? String else { return }
        self.parent.state.images = messageBodyAsString
            .convertToArray()
            .map { URL(string: $0)! }
        self.parent.state.isImageViewerPresented = true
    }

    private func processBackBridge() {
        self.parent.state.isPresentated.wrappedValue = false
    }

    private func processConfirmBridge(_ messageBody: Any) {
        guard let messageBodyAsString = messageBody as? String else { return }
        let messageBodyAsDictionary = messageBodyAsString.convertToDictionary()
        self.parent.state.alertMessage = messageBodyAsDictionary["message"] ?? ""
        self.parent.state.alertConfirmText = messageBodyAsDictionary["confirmText"] ?? ""
        self.parent.state.alertCancelText = messageBodyAsDictionary["cancelText"] ?? ""
        self.parent.state.isAlertPresented = true
    }

    private func processErrorBridge(_ messageBody: Any) {
        guard let messageBodyAsString = messageBody as? String else { return }
        let messageBodyAsDictionary = messageBodyAsString.convertToDictionary()
        self.parent.state.errorMessage = messageBodyAsDictionary["message"] ?? ""
        self.parent.state.isErrorAlertPresented = true
    }

    private func processPhotoPickerBridge() {
        self.parent.state.isPhotoPickerPresented = true
    }

    private func processActionSheetBridge(_ messageBody: Any) {
        guard let messageBodyAsString = messageBody as? String else { return }
        self.parent.state.actionSheetItems = messageBodyAsString
            .convertToArray()
        self.parent.state.isActionSheetPresented = true
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
            .components(separatedBy: ",")
            .map { $0.removeQuotationMarks() }
    }

    func removeQuotationMarks() -> String {
        var result = self
        result.removeFirst()
        result.removeLast()
        return result
    }

}
