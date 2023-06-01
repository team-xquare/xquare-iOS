import SwiftUI

import XWebKit

struct TermsCaptionView: View {
    private var url = "https://team-xquare.github.io/terms"
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("가입시 ").sdText(type: .caption2)
                NavigationLink(destination: {
                    XWebKitView(urlString: url + "/PrivacyPolicy.html")
                        .navigationTitle("개인정보처리방침")
                }, label: {
                    Text("개인정보처리방침").underline().sdText(type: .caption2)
                })
                Text(" 및 ").sdText(type: .caption2)
                NavigationLink(destination: {
                    XWebKitView(urlString: url + "/TermsOfService.html")
                        .navigationTitle("이용약관")
                }, label: {
                    Text("이용약관").underline().sdText(type: .caption2)
                })
                Text("에 동의하는").sdText(type: .caption2)
            }
            Text("것으로 간주합니다.").sdText(type: .caption2)
        }
    }
}
