import SwiftUI

import SemicolonDesign

struct MyInfoBundle: View {
    var name: String
    var birthDay: String
    var gradeClassNum: String
    var id: String

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            MyInfoDetail(title: "이름", infoDetail: name)
            MyInfoDetail(title: "생년월일", infoDetail: birthDay)
            MyInfoDetail(title: "학번", infoDetail: gradeClassNum)
            MyInfoDetail(title: "아이디", infoDetail: id)
        }
    }
}
