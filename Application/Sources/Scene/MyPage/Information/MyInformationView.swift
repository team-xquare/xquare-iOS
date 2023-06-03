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
            alignment: .leading,
            spacing: 0
        ) {
            Rectangle().frame(height: 0)
            MyProfileView(
                imageUrl: imageUrl,
                uiimage: $uiImage,
                name: name,
                gradeClassNum: gradeClassNum,
                xPhotosIsPresented: $xPhotosIsPresented
            )
            .padding([.leading, .top], 16)
            MyInfoIDAndBirthDay(id: id, birthDay: birthDay)
        }
        .background(Color.GrayScale.gray50)
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .foregroundColor(.GrayScale.gray300)
        }
        .padding(.horizontal, 16)
    }
}
