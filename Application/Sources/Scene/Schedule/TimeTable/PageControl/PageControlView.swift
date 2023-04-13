import SwiftUI

import SemicolonDesign

struct PageControlView: View {
    @Binding var weekDay: Int
    let page: Int
    let count: Int

    var body: some View {
        HStack(spacing: 12) {
            ForEach(page..<page+count, id: \.self) { index in
                Circle()
                    .fill(weekDay == index ? Color.gray : .white)
                    .frame(width: 12, height: 12)
                    .background(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    }
                    .onTapGesture {
                        weekDay = index
                    }
            }
        }
    }
}
