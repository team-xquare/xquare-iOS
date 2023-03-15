import SwiftUI

import SemicolonDesign

struct NotificationListCell: View {
    let image: Image
    let category: String
    let content: String
    let time: String

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            image
                .resizable()
                .frame(width: 16, height: 16)
                .padding(.trailing, 8)
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(category)
                        .sdText(type: .caption)

                    Spacer()

                    Text(time)
                        .sdText(type: .caption)
                }
                Text(content)
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
            }
        }
        .padding(16)
    }
}
