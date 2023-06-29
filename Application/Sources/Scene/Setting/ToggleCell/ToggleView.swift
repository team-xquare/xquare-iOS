import SwiftUI

import SemicolonDesign

struct ToggleView: View {

    var title: String
    var subTitle: String
    @Binding var isToggle: Bool
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                Text(subTitle)
                    .sdText(type: .caption2, textColor: .GrayScale.gray700)
            }
            Spacer()
            Toggle("", isOn: $isToggle)
                .toggleStyle(SwitchToggleStyle(tint: .Primary.purple400))
                .labelsHidden()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.GrayScale.gray50)
        .cornerRadius(12)
        .padding(.horizontal, 16)
    }
}
