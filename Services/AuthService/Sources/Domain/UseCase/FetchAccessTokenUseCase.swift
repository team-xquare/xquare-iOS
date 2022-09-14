import Foundation

public class FetchAccessTokenUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func excute() throws -> String {
        return try self.authRepository.fetchAccessToken()
    }

}
