import SwiftUI

import RxSwift
import RxCocoa

class XWebKitState: ObservableObject {

    var urlString: String = ""
    var accessToken: String = ""

    @Published var loadingProgress: Double = 0.0

    @Published var needsToNavigate: Bool = false
    @Published var naviagteLink: String = ""

    @Published var isImageViewerPresented: Bool = false
    @Published var images: [URL] = []

    var isPresentated: Binding<Bool>

    @Published var isAlertPresented: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertConfirmText: String = ""
    @Published var alertCancelText: String = ""
    var alertResponse = PublishSubject<Bool>()

    @Published var isErrorAlertPresented: Bool = false
    @Published var errorMessage: String = ""

    init(urlString: String, accessToken: String = "", isPresentated: Binding<Bool>) {
        self.urlString = urlString
        self.accessToken = accessToken
        self.isPresentated = isPresentated
    }

}
