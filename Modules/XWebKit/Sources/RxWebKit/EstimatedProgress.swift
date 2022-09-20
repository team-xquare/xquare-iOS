// Bring from RxSwiftCommunity/RxWebKit
// path: Sources/RxWebKit/Rx+WebKit.swift

import Foundation

import WebKit
import RxSwift

extension Reactive where Base: WKWebView {

    public var estimatedProgress: Observable<Double> {
        return self.observeWeakly(Double.self, "estimatedProgress")
            .map { $0 ?? 0.0 }
    }

}
