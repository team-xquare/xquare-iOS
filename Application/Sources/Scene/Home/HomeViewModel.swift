import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var imageUrl: String = ""
    @Published var name: String = "수준호"
    @Published var comment: String = "삼정 1점 벌점 2점"
    @Published var menu: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]
}
