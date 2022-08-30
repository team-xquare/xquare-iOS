import SwiftUI

import RxSwift
import RxCocoa

class XWebKitState: ObservableObject {

    @Published var urlString: String = ""

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

    init(
        title: String,
        urlString: String,
        isPresentated: Binding<Bool>
    ) {
        self.urlString = urlString
        self.isPresentated = isPresentated
    }

}
