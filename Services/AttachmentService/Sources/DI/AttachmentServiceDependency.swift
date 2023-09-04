import Foundation

public struct AttachmentServiceDependency {
    public static let shared = resolve()

    public let requestPresignedUrlUseCase: RequestPresignedUrlUseCase
    public let uploadImageToS3UseCase: UploadImageToS3UseCase
}

extension AttachmentServiceDependency {

    static func resolve() -> AttachmentServiceDependency {
        let remoteDataSource: RemoteAttachmentDataSource = RemoteAttachmentDataSourceImpl()
        let repository: AttachmentRepository = AttachmentRepositoryImpl(remoteDataSource: remoteDataSource)

        let requestPresignedUrlUseCase = RequestPresignedUrlUseCase(
            repository: repository
        )

        let uploadImageToS3UseCase = UploadImageToS3UseCase(
            repository: repository
        )

        return .init(
            requestPresignedUrlUseCase: requestPresignedUrlUseCase,
            uploadImageToS3UseCase: uploadImageToS3UseCase
        )

    }

}
