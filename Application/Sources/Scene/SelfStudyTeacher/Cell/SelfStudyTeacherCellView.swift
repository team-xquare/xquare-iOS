import SwiftUI
import PickService
import SemicolonDesign
import XDateUtil

struct SelfStudyTeacherCellView: View {
    var entity: TodaySelfStudyTeacherEntity
    var date: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(date)
                    .sdText(type: .body2, textColor: Color.GrayScale.gray900)
                VStack(spacing: 8) {
                    ForEach(0..<entity.teacher.count, id: \.self) { index in
                        if entity.teacher[index] != "" {
                            HStack(alignment: .center, spacing: 12) {
                                Text("\(index)층")
                                    .sdText(type: .body4, textColor: Color.GrayScale.gray800)
                                Text("\(entity.teacher[index]) 선생님")
                                    .sdText(type: .body2, textColor: Color.GrayScale.gray900)
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(16)
        .background(Color.GrayScale.gray50)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: date == Date().toString(format: "M월 d일 (E)") ? 1 : 0)
                .foregroundColor(.Primary.purple100)
        )
    }
}
