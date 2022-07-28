import SwiftUI
import SemicolonDesign

struct XWebKitProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: .infinity, height: 1)
            RoundedRectangle(cornerRadius: 14)
                .frame(
                    width: CGFloat(configuration.fractionCompleted ?? 0) * UIScreen.main.bounds.size.width,
                    height: 1
                )
                .foregroundColor(.Primary.purple400)
        }
    }
}

struct XWebKitProgressViewStylePreview: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.5)
            .progressViewStyle(XWebKitProgressViewStyle())
    }
}
