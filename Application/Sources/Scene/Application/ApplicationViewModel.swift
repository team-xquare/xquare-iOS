import Foundation

import AuthService

class ApplicationViewModel: ObservableObject {

    private let webviewURLString: String = "https://service.xquare.app/apply"
    private var accessToken: String = ""

    private let fetchAccessTokenUseCase: FetchAccessTokenUseCase

    init(fetchAccessTokenUseCase: FetchAccessTokenUseCase) {
        self.fetchAccessTokenUseCase = fetchAccessTokenUseCase
    }

    func getWebviewURLString() -> String {
        self.webviewURLString
    }

    func getAccessToken() -> String {
        do {
            return try self.fetchAccessTokenUseCase.excute()
        } catch {
            return ""
        }
    }

}
