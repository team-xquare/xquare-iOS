import SwiftUI

import SemicolonDesign

struct ScheduleButtonView: View {
    let clickTimeTableButton: () -> Void
    let clickAcademicScheduleButton: () -> Void
    @Binding var showTimeTable: Bool

    var body: some View {
        ZStack {
            HStack {
                if !showTimeTable {
                    Spacer()
                        .frame(width: 156)
                }
                Color.white
                    .frame(width: 152, height: 36)
                    .cornerRadius(22)
                    .animation(.easeIn, value: showTimeTable)
                if showTimeTable {
                    Spacer()
                        .frame(width: 156)
                }
            }
            .padding(4)
            .background(Color.GrayScale.gray50)
            .cornerRadius(22)

            HStack {
                Button(action: clickTimeTableButton) {
                    Text("시간표")
                        .sdText(
                            type: .body4,
                            textColor: showTimeTable ? .GrayScale.gray900 : .GrayScale.gray600
                        )
                        .frame(width: 152, height: 36)
                }
                Button(action: clickAcademicScheduleButton) {
                    Text("학사일정")
                        .sdText(
                            type: .body4,
                            textColor: !showTimeTable ? .GrayScale.gray900 : .GrayScale.gray600
                        )
                        .frame(width: 152, height: 36)
                }
            }
        }
    }
}
