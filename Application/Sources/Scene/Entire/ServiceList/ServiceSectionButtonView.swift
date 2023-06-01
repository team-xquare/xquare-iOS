import SwiftUI

import SemicolonDesign

// swiftlint: disable large_tuple
struct ServiceSectionButtonView: View {

    var headerText: String
    var services: [(text: String, action: () -> Void, textColor: Color)]

    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(headerText)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            ForEach(services, id: \.0) { service in
                ServiceListCellButtonView(
                    text: service.text,
                    action: service.action,
                    textColor: service.textColor
                )
            }
        }
        .padding(.horizontal, 16)
    }
}
// swiftlint: enable large_tuple
