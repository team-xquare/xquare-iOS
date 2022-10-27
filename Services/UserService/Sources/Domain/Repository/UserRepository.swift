import Foundation

import RxSwift

public protocol UserRepository {
    func fetchUserInformationById(userId: String) -> Single<UserEntity>
    func fetchUserInformationByName(accountId: String) -> Single<UserEntity>
    func fetchUserListByClass(grade: Int, classNumber: Int) -> Observable<[ClassUserEntity]>
    func fetchFCMToken(users: [String]) -> Single<FCMTokensEntity>
    func fetchExcludedUserList(users: [String]) -> Single<UserIdsEntity>
    func fetchUserSimpleInformation() -> Single<UserSimpleInformation>
}
