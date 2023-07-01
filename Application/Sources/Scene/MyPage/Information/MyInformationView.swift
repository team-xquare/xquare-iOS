import SwiftUI

import SemicolonDesign

struct MyInformationView: View {
    var imageUrl: URL?
    var name: String
    var gradeClassNum: String
    var id: String
    var birthDay: String

    @Binding var uiImage: UIImage
    @Binding var xPhotosIsPresented: Bool

    var body: some View {
        VStack(
            alignment: .center,
            spacing: 0
        ) {
            Spacer().frame(height: 20)
            MyProfileView(
                imageUrl: imageUrl,
                uiimage: $uiImage,
                xPhotosIsPresented: $xPhotosIsPresented
            )
            Spacer().frame(height: 54)
            MyInfoBundle(
                name: name,
                birthDay: birthDay,
                gradeClassNum: gradeClassNum,
                id: id
            )
        }
    }
}
