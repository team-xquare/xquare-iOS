import SwiftUI

import SemicolonDesign

struct AccountManagementView: View {
    let services: [(text: String, action: () -> Void)]
    var body: some View {
        VStack(alignment: .leading) {
            OptionTitleView(title: "계정 관리", subTitle: "기기내 계정에서 로그아웃 할 수 있어요.")
            Spacer().frame(height: 12)
            ForEach(services, id: \.0) { services in
                Button(action: services.action) {
                    VStack(alignment: .leading, spacing: 0) {
                        Rectangle().frame(height: 0)
                        Text(services.text)
                            .sdText(type: .body3, textColor: Color.GrayScale.gray900)
                    }
                    .padding(.vertical, 12)
                    .padding(.leading, 16)
                    .background(Color.GrayScale.gray50)
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
