import SwiftUI

import TimeTableService
import SemicolonDesign

struct TimeTableCell: View {
    let timeTable: DayTimeTableEntity

    // swiftlint:disable line_length
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("\(timeTable.period)교시")
                .sdText(type: .body1, textColor: .GrayScale.gray900)
                .padding(.trailing, 12)
                .frame(width: 58)
            AsyncImage(url: timeTable.subjectImageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.GrayScale.gray100
            }
            .frame(width: 40, height: 40)
            .cornerRadius(20)
            .padding(.trailing, 12)
            VStack(alignment: .leading, spacing: 1) {
                Text(timeTable.subjectName)
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                Text("\(timeTable.beginTime.toString(format: "HH:mm")) ~ \(timeTable.endTime.toString(format: "HH:mm"))")
                    .sdText(type: .caption, textColor: .GrayScale.gray600)
            }
        }
    }
}
