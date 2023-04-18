import SwiftUI

import SemicolonDesign

struct ImportantTextView: View {
    var text: String
    var isImportant: Bool = true
    var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .sdText(type: .body4, textColor: .GrayScale.gray900)
            Text(isImportant ? "*" : "")
                .foregroundColor(.red)
        }
    }
}
