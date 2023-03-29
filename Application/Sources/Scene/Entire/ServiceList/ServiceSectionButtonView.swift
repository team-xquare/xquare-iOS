import SwiftUI

import SemicolonDesign

struct ServiceSectionButtonView: View {

    var headerText: String
    var services: [(text: String, action: () -> Void)]

    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(headerText)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            ForEach(services, id: \.0) { service in
                ServiceListCellButtonView(text: service.text, action: service.action)
            }
        }
        .padding(.horizontal, 16)
    }
}
