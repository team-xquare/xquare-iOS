import SwiftUI

struct MovedClassView: View {

    var name: String
    var locationClassroom: String
    var comeBackClassroom: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("현재 \(name)님은")
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
                HStack(spacing: 0) {
                    Text(locationClassroom)
                        .sdText(type: .body3, textColor: .GrayScale.gray900)
                    Text("에 있습니다.")
                        .sdText(type: .body3, textColor: .GrayScale.gray900)
                }
            }
            Spacer()
            Button {
               comeBackClassroom()
            } label: {
                Text("교실로 돌아가기")
                    .sdText(type: .body4, textColor: .GrayScale.gray700)
                    .padding(EdgeInsets(top: 14, leading: 12, bottom: 14, trailing: 12))
                    .overlay { RoundedRectangle(cornerRadius: 12).stroke(Color.GrayScale.gray400) }
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Color.GrayScale.gray0)
        .cornerRadius(16)
    }
}
