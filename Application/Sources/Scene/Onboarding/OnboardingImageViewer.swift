import SwiftUI

struct OnboardingImageViewer: View {

    private let onboardingViews: [(image: Image, color: Color)] = [
        (.onboardingDms, .onboardingDms),
        (.onboardingDnms, .onboardingDnms),
        (.onboardingDdyzd, .onboardingDdyzd),
        (.onboardingJobits, .onboardingJobits),
        (.onboardingXquare, .onboardingXquare)
    ]

    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.Primary.purple400)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(.GrayScale.gray200)
    }

    var body: some View {
        TabView {
            ForEach(self.onboardingViews.indices, id: \.self) { index in
                VStack {
                    ZStack(alignment: .center) {
                        onboardingViews[index].color
                            .ignoresSafeArea(edges: .top)
                        onboardingViews[index].image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 60)
                    }
                    Spacer().frame(height: 56)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }

}
