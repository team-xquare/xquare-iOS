import SwiftUI

import RxSwift
import SemicolonDesign
import XNavigationAndTab

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
            ComposedWebView(state: state)
            if state.loadingProgress != 1 {
                VStack {
                    ProgressView(value: state.loadingProgress)
                        .progressViewStyle(XWebKitProgressViewStyle())
                    Spacer()
                }
            }
            NavigationLink(
                isActive: $state.needsToNavigate,
                destination: {
                    XWebKitView(
                        urlString: state.naviagteLink,
                        accessToken: state.accessToken,
                        isPresentated: $state.needsToNavigate
                    )
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
                    self.state.alertResponse.onNext(false)
                }),
                button2: (self.state.alertConfirmText, {
                    self.state.alertResponse.onNext(true)
                })
            )
        }
        .sdImageView(
            isPresented: self.$state.isImageViewerPresented,
            images: self.state.images
        )
    }
}
