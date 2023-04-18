import SwiftUI
import UIKit

import SemicolonDesign

struct OnboardingView: View {
    @EnvironmentObject var xquareRouter: XquareRouter

    var body: some View {
        VStack(spacing: 0) {
            OnboardingImageViewer()
            FillButton(
                text: "바로 시작하기",
                action: { self.xquareRouter.navigateTo(.signup) },
                type: .rounded
            )
            Button(action: {
                self.xquareRouter.navigateTo(.login)
            }, label: {
                HStack {
                    Text("이미 계정이 있으신가요?")
                        .sdText(type: .body4)
                    Text("로그인하기")
                        .sdText(type: .body3)
                }
            })
            Spacer(minLength: 40)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
    }
}
