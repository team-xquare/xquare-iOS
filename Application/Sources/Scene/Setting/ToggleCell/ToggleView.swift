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
                    .sdText(type: .caption2, textColor: .GrayScale.gray500)
            }
            Spacer()
            Toggle("", isOn: $isToggle)
                .toggleStyle(SwitchToggleStyle(tint: .Primary.purple400))
                .labelsHidden()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 24)
    }
}
