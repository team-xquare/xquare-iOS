import SwiftUI

import SemicolonDesign
import PointService
import XDateUtil

struct PointHistoryListCellView: View {

    let pointHistory: PointHistoryEntity

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(pointHistory.reason)
                    .sdText(type: .body2, textColor: .GrayScale.gray900)
                Text(pointHistory.date.toString(format: .fullDate))
                    .sdText(type: .caption)
            }
            Spacer()
            Text(String(pointHistory.point))
                .sdText(type: .heading6)
        }
        .padding([.vertical, .leading], 16)
        .padding(.trailing, 20)
        .background(Color.GrayScale.gray50)
        .cornerRadius(12)
    }
}
