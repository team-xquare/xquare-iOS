import Foundation

public class CheckIsTokenValidUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func excute() throws -> Bool {
        let expiredDate = try self.authRepository.fetchTokenExpiredDate()
        return Date() >= expiredDate
    }

}
