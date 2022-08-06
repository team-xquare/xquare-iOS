import SwiftUI

import RxSwift
import SemicolonDesign

public struct XWebKitView: View {

    @ObservedObject var state: XWebKitState

    public init(title: String = "", urlString: String) {
        self.state = .init(
            title: title,
            urlString: urlString,
            isPresentated: .constant(true)
        )
    }

    init(
        title: String = "",
        urlString: String,
        isPresentated: Binding<Bool>
    ) {
        self.state = .init(
            title: title,
            urlString: urlString,
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
                    XWebKitView(urlString: state.naviagteLink, isPresentated: $state.needsToNavigate)
                },
                label: { EmptyView() }
            )
        }
        .navigationTitle(state.title)
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

struct XWebKitViewPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            XWebKitView(
                title: "xbridge-test",
                urlString: "https://service.xquare.app/xbridge-test"
            )
        }.accentColor(.black)
    }
}
