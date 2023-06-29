import SwiftUI

import SemicolonDesign

// swiftlint: disable large_tuple
struct AccountSettingView: View {
    var services: [(text: String, subTitle: String?, action: () -> Void, textColor: Color)]
    var body: some View {
        VStack(alignment: .leading) {
            SettingTitleView(title: "계정")
            ForEach(services, id: \.0) { services in
                Button(action: services.action) {
                    VStack(alignment: .leading, spacing: 0) {
                        Rectangle().frame(height: 0)
                        Text(services.text)
                            .sdText(type: .body3, textColor: services.textColor)
                        if let subTitle = services.subTitle {
                            Spacer().frame(height: 4)
                            Text(subTitle)
                                .sdText(type: .caption2, textColor: .GrayScale.gray700)
                        }
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
