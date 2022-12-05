import SwiftUI

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
