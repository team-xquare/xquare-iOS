import Foundation

protocol LocalAuthDataSource {
    func registerIdAndPassword(id: String, password: String)
    func fetchIdAndPassword() -> IdAndPasswordEntity
}
