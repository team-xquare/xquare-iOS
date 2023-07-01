import SwiftUI

import SemicolonDesign

struct MyProfileView: View {
    var imageUrl: URL?
    @Binding var uiimage: UIImage
    @Binding var xPhotosIsPresented: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            ZStack(alignment: .bottomTrailing) {
                ProfileImageView(
                    imageUrl: imageUrl,
                    uiimage: $uiimage
                )
                Image.camera
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
            }
            Text("변경하기")
                .sdText(type: .body4, textColor: .GrayScale.gray900)
        }.onTapGesture {
            xPhotosIsPresented = true
        }
    }
}
