import SwiftUI

import SemicolonDesign

struct XPhotoPickerModifier: ViewModifier {

    var isPresented: Binding<Bool>

    var singleSelection: Binding<UIImage>?
    var multipleSelection: Binding<[UIImage]>?

    @State var isErrorAlertPresented: Bool = false

    init(isPresented: Binding<Bool>, selection: Binding<UIImage>) {
        self.isPresented = isPresented
        self.singleSelection = selection
        self.multipleSelection = nil
    }

    init(isPresented: Binding<Bool>, selection: Binding<[UIImage]>) {
        self.isPresented = isPresented
        self.singleSelection = nil
        self.multipleSelection = selection
    }

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: self.isPresented) {
                if let singleSelection {
                    XPhotoPicker(selection: singleSelection, isErrorAlertPresented: self.$isErrorAlertPresented)
                        .accentColor(.Primary.purple400)
                        .foregroundColor(.red)
                        .tint(.green)
                } else if let multipleSelection {
                    XPhotoPicker(selection: multipleSelection, isErrorAlertPresented: self.$isErrorAlertPresented)
                        .accentColor(.Primary.purple400)
                }
            }
            .sdErrorAlert(isPresented: self.$isErrorAlertPresented) {
                SDErrorAlert(errerMessage: "이미지 업로드에 실패하였습니다.")
            }
    }
}
