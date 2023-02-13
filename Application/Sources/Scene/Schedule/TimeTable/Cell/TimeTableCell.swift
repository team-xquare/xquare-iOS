import SwiftUI

import TimeTableService
import SemicolonDesign

struct TimeTableCell: View {
    let timeTable: DayTimeTableEntity

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("\(timeTable.period)교시")
                .sdText(type: .body1, textColor: .GrayScale.gray900)
                .padding(.trailing, 12)
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
                Text("창체")
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                Text("08:40 ~ 09:30")
                    .sdText(type: .caption, textColor: .GrayScale.gray600)
            }
        }
    }
}
