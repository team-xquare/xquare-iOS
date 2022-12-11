import Foundation

import RestApiModule
import RxSwift

protocol RemoteAttachmentDataSource: RestApiRemoteDataSource<AttachmentAPI> {
    func uploadFiles(files: [Data]) -> Single<[String]>
}
