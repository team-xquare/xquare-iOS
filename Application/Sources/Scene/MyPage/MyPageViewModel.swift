import Foundation

import UIKit

class MyPageViewModel: ObservableObject {
    @Published var profileImage: UIImage = UIImage()
    @Published var name: String = ""
    @Published var birthDay: String = ""
    @Published var gradeClassNumber: String = ""
    @Published var id: String = ""
}
