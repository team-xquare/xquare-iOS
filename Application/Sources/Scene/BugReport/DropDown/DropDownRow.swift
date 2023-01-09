import SwiftUI

import SemicolonDesign

struct DropDownRow: View {
    @Binding var isSelected: Bool
    var option: String
    var optionSelectedAction: ((_ option: String) -> Void)?

    var body: some View {
        Button {
            if let optionSelectedAction = self.optionSelectedAction {
                optionSelectedAction(self.option)
            }
        } label: {
            HStack {
                Spacer()
                    .frame(width: 12)
                Text(option)
                    .sdText(type: .body4)
                Spacer()
            }
            .frame(height: 32)
            .background(Color.GrayScale.gray100)
        }
    }
}
