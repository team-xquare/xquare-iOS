import Foundation

class SignUpViewModel: ObservableObject {
    @Published var authCode: String = ""
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var reEnterPassword: String = ""
}
