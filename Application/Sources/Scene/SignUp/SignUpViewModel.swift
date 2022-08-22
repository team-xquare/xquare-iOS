import Foundation

import AuthService
import RxSwift

class SignUpViewModel: ObservableObject {
    @Published var authCode: String = ""
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var reEnterPassword: String = ""
    @Published var isSuccess: Bool = false

    private let signupuseCase: SignupUseCase

    private var disposeBag = DisposeBag()

    init(signupUseCase: SignupUseCase) {
        self.signupuseCase = signupUseCase
    }

    func signUp() {
        self.signupuseCase.excute(data: .init(
            authCode: authCode,
            id: id,
            profileImageUrl: nil,
            password: password
        )).subscribe {
            self.isSuccess = true
        } onError: { _ in
            self.isSuccess = false
        }.disposed(by: disposeBag)
    }
}
