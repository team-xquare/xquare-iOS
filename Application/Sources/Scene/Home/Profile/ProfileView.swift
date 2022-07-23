import SwiftUI

import SemicolonDesign

struct ProfileView: View {

    @State var imageUrl: String
    @State var name: String
    @State var merit: Int
    @State var demerit: Int

    var body: some View {
            HStack(spacing: 12) {
                Spacer().frame(width: 16)
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.GrayScale.gray200
                }
                .frame(width: 44, height: 44)
                .cornerRadius(22)
                VStack(alignment: .leading, spacing: 0) {
                    Text(name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.GrayScale.gray900)
                    Text("상점 \(merit)점 벌점 \(demerit)점").sdText(type: .body4)
                }
                Spacer()
            }
            .frame(height: 76)
            .background(Color.GrayScale.gray0)
            .cornerRadius(16)
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(imageUrl: "", name: "수준호", merit: 1, demerit: 2)
            .previewLayout(.sizeThatFits)
    }
}
