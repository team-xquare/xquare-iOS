import SwiftUI

struct SelectButtonView: View {

    @Binding var selection: Bool
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.selection = true
            self.action()
        }, label: {
            Text(self.text)
                .sdText(
                    type: self.selection ? .body3 : .body4,
                    textColor: self.selection ? .GrayScale.gray50 : .GrayScale.gray900
                )
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(self.selection ? Color.Primary.purple400 : Color.GrayScale.gray50)
                .cornerRadius(16)
        })
    }

}
