import SwiftUI

import RxSwift
import RxCocoa

class XWebKitState: ObservableObject {

    @Published var loadingProgress: Double = 0.0

    @Published var isNavigated: Bool = false
    @Published var naviagteLink: String = ""

    @Published var isImageViewerPresented: Bool = false
    @Published var images: [URL] = []

    @Published var isAlertPresented: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertConfirmText: String = ""
    @Published var alertCancelText: String = ""
    var alertResponse = PublishSubject<Bool>()

}
