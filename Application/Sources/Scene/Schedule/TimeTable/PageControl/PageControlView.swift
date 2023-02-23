import SwiftUI

import SemicolonDesign

struct PageControlView: View {
    @Binding var weekDay: Int

    var body: some View {
        HStack(spacing: 12) {
            ForEach(1...5, id: \.self) { index in
                Circle()
                    .fill(weekDay == index ? Color.gray : .white)
                    .frame(width: 12, height: 12)
                    .background(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    }
            }
        }
    }
}
