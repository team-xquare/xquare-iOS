import SwiftUI
import SemicolonDesign

struct BugImageView: View {
    @Binding var isLoading: Bool
    @Binding var uiimage: UIImage

    var body: some View {
        if isLoading {
            ProgressView()
                .frame(width: 160, height: 160)
                .background(Color.GrayScale.gray100)
                .cornerRadius(8)
                .padding(.bottom, 24)
        } else {
            if uiimage == UIImage() {
                Spacer()
                    .frame(width: 160, height: 160)
                    .background(Color.GrayScale.gray100)
                    .cornerRadius(8)
                    .padding(.bottom, 24)
            } else {
                Image(uiImage: uiimage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .cornerRadius(8)
                    .padding(.bottom, 24)
            }
        }
    }
}
