import SwiftUI

struct ProfileImageView: View {
    var imageUrl: URL?
    @Binding var uiimage: UIImage

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if uiimage == UIImage() {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image("DefaultImage")
                }
                .frame(width: 60, height: 60)
                .cornerRadius(30)
            } else {
                Image(uiImage: uiimage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
            }
            Image.camera
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
        }
    }
}
