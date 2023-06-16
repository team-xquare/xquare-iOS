import SwiftUI
import SemicolonDesign

struct BugImageView: View {
    @Binding var isLoading: Bool
    @Binding var uiimage: [UIImage]
    @Binding var isEmpty: Bool
    @Binding var xPhotosIsPresented: Bool
    var body: some View {
        if isLoading {
            ProgressView()
                .frame(width: 160, height: 160)
                .background(Color.GrayScale.gray100)
                .cornerRadius(8)
                .padding(.bottom, 24)
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    if !isEmpty {
                        ForEach(uiimage, id: \.self) {
                            Image(uiImage: $0)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 160)
                                .cornerRadius(8)
                                .padding(.bottom, 24)
                        }
                    } else {
                        ZStack(alignment: .center) {
                            Spacer()
                            Image.defaultBugImage
                        }
                        .frame(width: 160, height: 160)
                        .background(Color.GrayScale.gray100)
                        .cornerRadius(8)
                        .padding(.bottom, 24)
                    }
                }
                .onTapGesture {
                    xPhotosIsPresented = true
                }
            }
        }
    }
}
