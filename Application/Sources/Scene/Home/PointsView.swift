import SwiftUI

import SemicolonDesign

struct PointsView: View {
    @State var imageUrl: String
    @State var name: String
    @State var comment: String
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            HStack(spacing: 12) {
                Spacer()
                    .frame(width: 16)
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .background(Color.GrayScale.gray200)
                }.frame(width: 44, height: 44)
                    .cornerRadius(22)
                VStack(alignment: .leading, spacing: 0) {
                    SDText(name, type: .body1)
                    SDText(comment, type: .body2)
                }
                Spacer()
            }.frame(height: 76)
                .background(Color.GrayScale.gray0)
                .cornerRadius(16)
            Spacer()
                .frame(width: 16)
        }
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(imageUrl: "", name: "수준호", comment: "상점 1점 벌점 2점")
    }
}
