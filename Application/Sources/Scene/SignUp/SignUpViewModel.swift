import Foundation

import AuthService
import RxSwift

class SignUpViewModel: ObservableObject {
    @Published var authCode: String = ""
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var reEnterPassword: String = ""

    private let signupuseCase: SignupUseCase

    init(signupUseCase: SignupUseCase) {
        self.signupuseCase = signupUseCase
    }

    func signUp() {
        self.signupuseCase.excute(data: .init(authCode: authCode, id: id, password: password))
    }
}
