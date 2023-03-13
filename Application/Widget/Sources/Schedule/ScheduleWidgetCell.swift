import SwiftUI

import SemicolonDesign

struct ScheduleWidgetCell: View {
    @Environment(\.colorScheme) var colorScheme
    let schedule: String

    var body: some View {
        HStack(spacing: 0) {
            if colorScheme == .light {
                Color.Primary.purple400
                    .frame(width: 4, height: 27)
                    .cornerRadius(4)
                    .padding(.trailing, 2)
            } else {
                Color.Primary.purple900
                    .frame(width: 4, height: 27)
                    .cornerRadius(4)
                    .padding(.trailing, 2)
            }
            HStack {
                Text(schedule)
                    .sdText(
                        type: .caption,
                        textColor: colorScheme == .light ? .Primary.purple400 : .Primary.purple900
                    )
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
