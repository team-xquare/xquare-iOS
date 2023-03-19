import SwiftUI

import SemicolonDesign
import XDateUtil

struct NotificationListCell: View {
    let image: Image
    let category: String
    let content: String
    let time: String

    var body: some View {
        HStack(alignment: .top, spacing: 0) {

            image
                .frame(width: 24, height: 24)
                .padding(.trailing, 4)

            VStack(alignment: .leading, spacing: 0) {

                HStack(spacing: 4) {
                    Text(category)
                        .sdText(type: .caption)

                    Spacer()

                    Text("\(Int(Date().toString(format: "HH")) ?? 0 - (Int(time) ?? 0))")
                        .sdText(type: .caption)
                }

                Text(content)
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
            }
            .padding(.top, 2)

        }
        .padding(16)
    }

}
