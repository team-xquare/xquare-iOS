import SwiftUI

import ScheduleService
import SemicolonDesign

struct AcademicScheduleCell: View {
    let schedule: ScheduleEntity
    @Binding var isShowBottomSheet: Bool
    @Binding var scheduleId: String
    @Binding var title: String
    @Binding var day: String

    var body: some View {
        HStack(spacing: 0) {
            Color.Primary.purple400
                .frame(width: 4, height: 64)
                .padding(.trailing, 21)
            VStack(spacing: 1) {
                Text(schedule.date.toString(format: "d"))
                    .sdText(type: .heading6, textColor: .GrayScale.gray900)
                Text(schedule.date.toString(format: "E"))
                    .sdText(type: .body4)
            }
            .frame(width: 25)
            .padding(.trailing, 14)
            Text(schedule.name)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            Spacer()
            Button {
                self.isShowBottomSheet = true
                self.scheduleId = schedule.id
                self.title = schedule.name
                self.day = schedule.date.toString(format: .fullDate)
            } label: {
                Image.moreIcon
                    .frame(width: 24, height: 24)
            }
            .padding(.trailing, 6)
        }
        .padding(.bottom, 4)
    }
}
