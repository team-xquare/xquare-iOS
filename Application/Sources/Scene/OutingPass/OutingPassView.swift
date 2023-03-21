import SwiftUI

import SemicolonDesign

struct OutingPassView: View {
    @StateObject var viewModel: OutingPassViewModel
    @State var isCapture: Bool = false

    // swiftlint:disable line_length
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
                AsyncImage(url: URL(string: viewModel.outingPassData.profileFileName)) { image in
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
                Text("\(viewModel.outingPassData.studentNumber) \(viewModel.outingPassData.studentName)")
                    .sdText(type: .heading6)
                Spacer()
            }
            Spacer().frame(height: 38)
            OutingInformationView(
                title: "외출 시간",
                content: "\(viewModel.outingPassData.startTime.toString(format: "HH:mm")) ~ \(viewModel.outingPassData.endTime.toString(format: "HH:mm"))"
            )
            OutingInformationView(title: "사유", content: viewModel.outingPassData.reason)
            OutingInformationView(title: "확인교사", content: viewModel.outingPassData.teacherName)
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
        .sdOkayAlert(isPresented: $isCapture, sdAlert: {
            SDOkayAlert(title: "캡처 감지", message: "외출증을 캡처하여 악용한다면 불이익을 얻을 수 있습니다.")
        })
    }
}
