import SwiftUI

import SemicolonDesign

struct LaunchScreenView: View {

    @EnvironmentObject var xquareRouter: XquareRouter
    @StateObject var viewModel: LaunchScreenViewModel

    var body: some View {
        ZStack {
            Color.Primary.purple400
                .ignoresSafeArea(edges: .all)
            Image.logo
                .frame(width: 250, height: 250, alignment: .center)
        }
        .onChange(of: viewModel.isSuccessToRefreshToken, perform: { isSuccess in
            if isSuccess {
                self.xquareRouter.presentFullScreen(.main)
            }
        })
        .onChange(of: viewModel.isFailureToRefreshToken, perform: { isFaile in
            if isFaile {
                self.xquareRouter.presentFullScreen(.onboarding)
            }
        })
        .onChange(of: self.xquareRouter.stack.last?.screen, perform: {
            guard $0 == .launch else { return }
            viewModel.refreshToken()
        })
        .onAppear(perform: viewModel.refreshToken)
    }
}
