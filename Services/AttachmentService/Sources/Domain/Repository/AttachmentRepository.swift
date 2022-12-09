import Foundation

import RxSwift

protocol AttachmentRepository {
    func uploadImage(files: [Data]) -> Single<[String]>
}
