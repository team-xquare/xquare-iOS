import SwiftUI

import SemicolonDesign

struct MyProfileView: View {
    var imageUrl: URL?
    @Binding var uiimage: UIImage
    var name: String
    var gradeClassNum: String
    @Binding var xPhotosIsPresented: Bool
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            ZStack(alignment: .bottomTrailing) {
                ProfileImageView(
                    imageUrl: imageUrl,
                    uiimage: $uiimage
                )
                Image.camera
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
            }.onTapGesture {
                xPhotosIsPresented = true
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                Text(gradeClassNum)
                    .sdText(type: .body2, textColor: .GrayScale.gray900)
            }
            Spacer()
        }
        .padding(.bottom, 20)
        .padding(.leading, 4)
    }
}
