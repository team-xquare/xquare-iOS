import Foundation

import AuthService

class FeedViewModel: ObservableObject {

    private let webviewURLString: String = "https://service.xquare.app/feed"
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
