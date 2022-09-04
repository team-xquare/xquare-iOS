import SwiftUI
import UIKit

import SemicolonDesign

struct OnboardingView: View {

    @State var isSignupViewPresented: Bool = false
    @State var isLoginViewPresented: Bool = false

    var signupView: SignupView
    var loginView: LoginView

    var body: some View {
        VStack {
            OnboardingImageViewer()
            FillButton(
                text: "바로 시작하기",
                action: { self.isSignupViewPresented = true },
                type: .rounded
            )
            Button(action: {
                self.isLoginViewPresented = true
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
        .ignoresSafeArea(edges: .top)
        .fullScreenCover(isPresented: self.$isSignupViewPresented) {
            signupView
        }
        .fullScreenCover(isPresented: self.$isLoginViewPresented) {
            loginView
        }
    }
}
