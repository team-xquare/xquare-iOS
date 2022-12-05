import Foundation

import UIKit

class MyPageViewModel: ObservableObject {
    @Published var profileImage = UIImage()
    @Published var name: String = "김기영"
    @Published var birthDay: String = "2005.05.30"
    @Published var gradeClassNumber: String = "2학년 1반 3번"
    @Published var id: String = "rlarldud"
    @Published var showActionSheet: Bool = false
}
