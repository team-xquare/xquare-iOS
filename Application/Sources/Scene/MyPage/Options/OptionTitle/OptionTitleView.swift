import SwiftUI

import SemicolonDesign

struct OptionTitleView: View {
    var title: String
    var subTitle: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            if let subTitle = subTitle {
                Text(subTitle)
                    .sdText(type: .caption2, textColor: .GrayScale.gray700)
            }
        }
        .padding(.horizontal, 16)
    }
}
