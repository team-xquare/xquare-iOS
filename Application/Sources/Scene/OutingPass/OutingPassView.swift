import SwiftUI

import SemicolonDesign

struct OutingPassView: View {
    @StateObject var viewModel: OutingPassViewModel
    @State var isCapture: Bool = false

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 12)
            GeometryReader { gemotry in
                SlidingTextView(geometryProxy: gemotry)
            }
            .frame(height: 30)
            .padding(.bottom, 44)
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image("DefaultImage")
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 60, height: 60)
                .cornerRadius(30)
                Spacer().frame(width: 16)
                Text("\(viewModel.studentNumber) \(viewModel.name)")
                    .sdText(type: .heading6)
                Spacer()
            }
            Spacer().frame(height: 38)
            OutingInformationView(title: "외출 시간", content: viewModel.time)
            OutingInformationView(title: "사유", content: viewModel.resone)
            OutingInformationView(title: "확인교사", content: viewModel.teacher)
            Spacer()
            GeometryReader { gemotry in
                SlidingTextView(geometryProxy: gemotry)
            }
            .frame(height: 30)
            .padding(.bottom, 28)
        }
        .padding(.horizontal, 16)
        .onAppear(perform: viewModel.fetchOutingPass)
        .navigationTitle("외출증")
        .navigationBarBackButtonHidden()
        .setNavigationBackButton()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification),
                   perform: { _ in
            self.isCapture = true
        })
        .sdErrorAlert(isPresented: $isCapture, sdAlert: {
            SDErrorAlert(errerMessage: "외출증을 캡처하여 악용한다면 불이익을 얻을 수 있습니다.")
        })
    }
}
