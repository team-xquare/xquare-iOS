import SwiftUI
import SemicolonDesign
import XDateUtil

struct SelfStudyTeacherCellView: View {
    var date = "3월 31일 (금)"
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(date)
                    .sdText(type: .body2, textColor: Color.GrayScale.gray900)
                VStack(spacing: 8) {
                    ForEach(2..<5) { index in
                        HStack(alignment: .center, spacing: 12) {
                            Text("\(index)층")
                                .sdText(type: .body4, textColor: Color.GrayScale.gray800)
                            Text("신요셉선생님")
                                .sdText(type: .body2, textColor: Color.GrayScale.gray900)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(16)
        .background(Color.GrayScale.gray50)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: date == Date().toString(format: "M월 d일 (E)") ? 1 : 0)
                .foregroundColor(.Primary.purple100)
        )
    }
}

struct SelfStudyTeacherCellView_Previews: PreviewProvider {
    static var previews: some View {
        SelfStudyTeacherCellView()
    }
}
