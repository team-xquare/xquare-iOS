import SwiftUI

import ScheduleService
import SemicolonDesign

struct AcademicScheduleCell: View {
    let schedule: ScheduleEntity

    var body: some View {
        HStack(spacing: 0) {
            Color.Primary.purple400
                .frame(width: 4, height: 64)
                .padding(.trailing, 21)
            VStack(spacing: 1) {
                Text(schedule.date.toString(format: .day))
                    .sdText(type: .heading6, textColor: .GrayScale.gray900)
                Text(schedule.date.toString(format: "E"))
                    .sdText(type: .body4)
            }
            .padding(.trailing, 21)
            Text(schedule.name)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            Spacer()
        }
        .padding(.bottom, 4)
    }
}
