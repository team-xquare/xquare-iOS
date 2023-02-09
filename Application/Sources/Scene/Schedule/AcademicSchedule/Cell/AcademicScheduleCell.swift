import SwiftUI

import SemicolonDesign

struct AcademicScheduleCell: View {
    var body: some View {
        HStack(spacing: 0) {
            Color.Primary.purple400
                .frame(width: 4, height: 64)
                .padding(.trailing, 21)
            VStack(spacing: 1) {
                Text("4")
                    .sdText(type: .heading6, textColor: .GrayScale.gray900)
                Text("금")
                    .sdText(type: .body4)
            }
            .padding(.trailing, 21)
            Text("의무귀가")
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            Spacer()
        }
        .padding(.bottom, 4)
    }
}
