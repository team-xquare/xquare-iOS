import SwiftUI
import ReportService
import SemicolonDesign
import XDateUtil

struct ReleaseNoteCellView: View {
    var entity: ReleaseNoteEntity
    var index: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(entity.releaseVersion) 업데이트 🚀")
                    .sdText(type: .body1, textColor: Color.GrayScale.gray900)
                    .padding(.bottom, 5)
                Text("새로운 기능")
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
                Text("\(entity.featureContent)")
                    .sdText(type: .body4, textColor: .GrayScale.gray800)
                    .padding(.bottom, 5)
                Text("개선된 버그")
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
                Text("\(entity.bugFixContent)")
                    .sdText(type: .body4, textColor: .GrayScale.gray800)
            }
            Spacer()
        }
        .padding(16)
        .background(Color.GrayScale.gray50)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: index ? 1 : 0)
                .foregroundColor(.Primary.purple100)
        )
    }
}
