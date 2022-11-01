import SwiftUI

public extension View {
    func xPhotoViewer(isPresented: Binding<Bool>, images: [URL]) -> some View {
        self.fullScreenCover(isPresented: isPresented) {
            XPhotoViewer(images: images)
        }
    }
}

public struct XPhotoViewer: View {

    @Environment(\.presentationMode) var presentationMode

    var images: [URL]

    public var body: some View {
        NavigationView {
            TabView {
                ForEach(images, id: \.self) { item in
                    VStack {
                        AsyncImage(url: item) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                                .tint(.white)
                        }
                        Spacer().frame(height: 42)
                    }
                }
            }
            .background(.black)
            .tabViewStyle(PageTabViewStyle())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .tint(.white)
                    })
                }
            }
        }
    }
}
