import SwiftUI

import SemicolonDesign

struct DropDownSelector: View {
    @Binding var showDropDown: Bool
    @Binding var selectedOptions: String
    var optionsSelectedActions: ((_ options: String) -> Void)?

    var body: some View {
        Button {
            self.showDropDown.toggle()
        } label: {
            HStack(alignment: .center) {
                Text(selectedOptions)
                    .sdText(type: .body4)
                    .padding(.leading, 12)
                    .padding(.trailing, 4)
                Image(systemName: self.showDropDown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 7.5, height: 6.75)
                    .foregroundColor(Color.GrayScale.gray600)
                    .padding(.trailing, 14)
            }
        }
        .frame(height: 32)
        .background(Color.GrayScale.gray100)
        .cornerRadius(16)
        .overlay(
            VStack {
                if self.showDropDown {
                    DropDown(
                        text: $selectedOptions,
                        options: [
                            "홈",
                            "일정",
                            "피드",
                            "신청",
                            "전체"
                        ]) { option in
                            self.showDropDown = false
                            self.selectedOptions = option
                            self.optionsSelectedActions?(option)
                        }
                        .padding(.top, 40)
                }
            },
            alignment: .topLeading
        )
    }
}
