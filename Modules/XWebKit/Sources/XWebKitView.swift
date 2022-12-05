import SwiftUI

import SemicolonDesign
import XNavigationAndTab
import XPhotos

public struct XWebKitView: View {

    @ObservedObject var state: XWebKitState

    public init(urlString: String, accessToken: String = "") {
        self.state = .init(
            urlString: urlString,
            accessToken: accessToken,
            isPresentated: .constant(true)
        )
    }

    init(urlString: String, accessToken: String, isPresentated: Binding<Bool>) {
        self.state = .init(
            urlString: urlString,
            accessToken: accessToken,
            isPresentated: isPresentated
        )
    }

    public var body: some View {
        ZStack {
            ComposedWebView(state: self.state)
            if self.state.loadingProgress != 1 {
                VStack {
                    ProgressView(value: self.state.loadingProgress)
                        .progressViewStyle(XWebKitProgressViewStyle())
                    Spacer()
                }
            }
            NavigationLink(
                isActive: self.$state.needsToNavigate,
                destination: {
                    XWebKitView(
                        urlString: self.state.naviagteLink,
                        accessToken: self.state.accessToken,
                        isPresentated: self.$state.needsToNavigate
                    )
                    .navigationTitle(self.state.naviagteTitle)
                    .navigationBarTitleDisplayMode(.inline)
                },
                label: { EmptyView() }
            )
        }
        .sdAlert(isPresented: self.$state.isAlertPresented) {
            SDAlert(
                title: self.state.alertMessage,
                content: .init(),
                button1: (self.state.alertCancelText, {
                    self.state.alertResponse = false
                }),
                button2: (self.state.alertConfirmText, {
                    self.state.alertResponse = true
                })
            )
        }
        .xPhotoViewer(
            isPresented: self.$state.isImageViewerPresented,
            images: self.state.images
        )
        .sdErrorAlert(isPresented: self.$state.isErrorAlertPresented) {
            SDErrorAlert(errerMessage: self.state.errorMessage)
        }
        .xPhotoPicker(
            isPresented: self.$state.isPhotoPickerPresented,
            selection: self.$state.selectedImages
        )
    }
}
