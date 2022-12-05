import Foundation

import RxSwift
import RestApiModule

protocol RemoteUserDataSource: RestApiRemoteDataSource<UserAPI> {
    func fetchUserInformationById(userId: String) -> Single<UserEntity>
    func fetchUserInformationByName(accountId: String) -> Single<UserEntity>
    func fetchUserListByClass(grade: Int, classNumber: Int) -> Single<[ClassUserEntity]>
    func fetchFCMToken(users: [String]) -> Single<FCMTokensEntity>
    func fetchExcludedUserList(users: [String]) -> Single<UserIdsEntity>
    func fetchUserSimpleInformation() -> Single<UserSimpleInformation>
    func fetchProfile() -> Single<ProfileEntity>
    func editProfileImage(profileImage: String) -> Completable
}
