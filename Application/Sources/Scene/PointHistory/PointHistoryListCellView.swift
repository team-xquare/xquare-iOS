import SwiftUI

import SemicolonDesign
import XDateUtil

struct PointHistoryListCellView: View {

    var date: Date
    var reason: String
    var point: Int

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(reason)
                    .sdText(type: .body2, textColor: .GrayScale.gray900)
                Text(date.toString(format: .fullDate))
                    .sdText(type: .caption)
            }
            Spacer()
            Text(String(point))
                .sdText(type: .heading6)
        }
        .padding([.vertical, .leading], 16)
        .padding(.trailing, 20)
        .background(Color.GrayScale.gray50)
        .cornerRadius(12)
    }
}
