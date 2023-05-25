import SwiftUI

import SemicolonDesign

struct MyInformationTextField: View {
    let title: String
    @Binding var content: String
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text(title)
                .sdText(type: .body4, textColor: .GrayScale.gray900)
                .padding(.bottom, 8)
            TextField("", text: $content)
                .modifier(MyInformationTextFieldModifier(
                    text: content
                )
            )
        }
        .padding(.bottom, 20)
    }
}

struct MyInformationTextFieldModifier: ViewModifier {

    var text: String

    func body(content: Content) -> some View {
        content
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .font(.system(size: 16))
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            .frame(height: 44, alignment: .center)
            .background(Color.GrayScale.gray50)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.GrayScale.gray300)
            }
            .foregroundColor(.GrayScale.gray800)
    }

}
