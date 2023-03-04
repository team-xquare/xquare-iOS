import SwiftUI

import SemicolonDesign

struct DropDown: View {
    @Binding var text: String
    var options: [String]
    var optionSelectedAction: ((_ option: String) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(options, id: \.self) { option in
                    DropDownRow(
                        isSelected: .constant(text == option),
                        option: option,
                        optionSelectedAction: optionSelectedAction
                    )
                }
            }
            .cornerRadius(10)
        }
        .frame(width: 120, height: CGFloat(options.count) * 40)
        .shadow(radius: 0.5)
    }
}
