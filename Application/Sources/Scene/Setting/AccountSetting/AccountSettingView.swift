import SwiftUI

import SemicolonDesign

// swiftlint: disable large_tuple
struct AccountSettingView: View {
    var services: [(text: String, action: () -> Void, textColor: Color)]
    var body: some View {
        VStack(alignment: .leading) {
            SettingTitle(
                title: "계정 관리",
                subTitle: "기기내 계정에서 로그아웃 할 수 있어요."
            )
            ForEach(services, id: \.0) { services in
                Button(action: services.action) {
                    VStack(alignment: .leading, spacing: 0) {
                        Rectangle().frame(height: 0)
                        Text(services.text)
                            .sdText(type: .body4, textColor: services.textColor)
                    }
                    .padding(.vertical, 12)
                    .padding(.leading, 16)
                    .background(Color.GrayScale.gray50)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
// swiftlint: enable large_tuple
