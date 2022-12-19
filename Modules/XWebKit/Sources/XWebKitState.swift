import SwiftUI

import Combine

class XWebKitState: ObservableObject {

    var urlString: String = ""
    var accessToken: String = ""

    var isPresentated: Binding<Bool>

    var cancellables = Set<AnyCancellable>()

    @Published var loadingProgress: Double = 0.0

    @Published var needsToNavigate: Bool = false
    @Published var naviagteTitle: String = ""
    @Published var naviagteLink: String = ""

    @Published var isImageViewerPresented: Bool = false
    @Published var images: [URL] = []

    @Published var isAlertPresented: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertConfirmText: String = ""
    @Published var alertCancelText: String = ""
    @Published var alertResponse: Bool?

    @Published var isErrorAlertPresented: Bool = false
    @Published var errorMessage: String = ""

    @Published var isPhotoPickerPresented: Bool = false
    @Published var selectedImages: [UIImage] = []

    @Published var isActionSheetPresented: Bool = false
    @Published var actionSheetItems: [String] = []
    @Published var selectedActionSheetItemIndex: Int?

    init(urlString: String, accessToken: String = "", isPresentated: Binding<Bool>) {
        self.urlString = urlString
        self.accessToken = accessToken
        self.isPresentated = isPresentated
    }

}
