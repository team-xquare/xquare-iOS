import Foundation

public struct AttachmentServiceDependency {
    public static let shared = resolve()

    public let uploadImageUseCase: UploadImageUseCase
}

public extension AttachmentServiceDependency {

    static func resolve() -> AttachmentServiceDependency {
        let remoteDataSource: RemoteAttachmentDataSource = RemoteAttachmentDataSourceImpl()
        let repository: AttachmentRepository = AttachmentRepositoryImpl(remoteDataSource: remoteDataSource)

        let uploadImageUseCase = UploadImageUseCase(
            repository: repository
        )

        return .init(uploadImageUseCase: uploadImageUseCase)

    }

}
