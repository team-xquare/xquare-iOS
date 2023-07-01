import SwiftUI

import SemicolonDesign

struct MyInfoDetail: View {
    var title: String
    var infoDetail: String

    var body: some View {
        HStack {
            Text(title)
                .sdText(type: .body2, textColor: .GrayScale.gray900)
            Spacer()
            Text(infoDetail)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
        }
        .padding(.horizontal, 16)
    }
}
