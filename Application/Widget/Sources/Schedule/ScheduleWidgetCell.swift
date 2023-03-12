import SwiftUI

import SemicolonDesign

struct ScheduleWidgetCell: View {
    let schedule: String

    var body: some View {
        HStack(spacing: 0) {
            Color.Primary.purple400
                .frame(width: 4, height: 27)
                .cornerRadius(4)
                .padding(.trailing, 2)
            HStack {
                Text(schedule)
                    .sdText(type: .caption, textColor: .Primary.purple400)
                    .padding(.leading, 10)
                Spacer()
            }
            .frame(height: 27)
            .background(Color.Primary.purple50)
            .cornerRadius(4)
            Spacer()
        }
    }
}
