import SwiftUI

enum OnboardingImage: CaseIterable {
    case dms

    var image: Image {
        switch self {
        case .dms: return .onboardingDms
        }
    }

}

struct OnboardingImageViewer: View {
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.Primary.purple400)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(.GrayScale.gray200)
    }

    var body: some View {
        TabView {
            ForEach(OnboardingImage.allCases, id: \.self) { image in
                VStack {
                    image.image
                        .resizable()
                        .ignoresSafeArea(edges: .top)
                        .scaledToFill()
                    Spacer().frame(height: 56)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }

}
