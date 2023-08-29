import Foundation
import UIKit
import ReportService
import RxSwift
import AttachmentService
class BugReportViewModel: ObservableObject {
    @Published var bugPlace: String = "홈"
    @Published var content: String = ""
    @Published var isDisabled: Bool = true
    @Published var isSuccess: Bool = false
    @Published var isOverStorage: Bool = false
    @Published var bugImageUrl = [""]
    @Published var bugImage: [UIImage] = [UIImage()]
    @Published var xPhotosIsPresented: Bool = false
    @Published var isLoading: Bool = false
    @Published var isEmpty: Bool = false
    var catagory: BugCategory = .home

    private let postBugReportUseCase: PostBugReportUseCase
    private let requestPresignedUrlUseCase: RequestPresignedUrlUseCase
    private let uploadImageToS3UseCase: UploadImageToS3UseCase

    private var disposeBag = DisposeBag()

    init(
        postBugReportUseCase: PostBugReportUseCase,
        requestPresignedUrlUseCase: RequestPresignedUrlUseCase,
        uploadImageToS3UseCase: UploadImageToS3UseCase
    ) {
        self.postBugReportUseCase = postBugReportUseCase
        self.requestPresignedUrlUseCase = requestPresignedUrlUseCase
        self.uploadImageToS3UseCase = uploadImageToS3UseCase
    }

    func checkBugPlaceAndContentIsEmpty() {
        isDisabled = bugPlace.isEmpty || content.isEmpty
    }

    func uploadImage() {
        let imageDatas = self.bugImage.map { $0.jpegData(compressionQuality: 0.3) ?? Data() }
        for image in imageDatas {
            guard image.count / 1048576 < 10 else {
                self.isLoading = false
                self.isOverStorage = true
                return
            }
        }
        self.requestPresignedUrlUseCase
            .excute(files: imageDatas)
            .subscribe(
                with: self,
                onSuccess: { owner, datas  in
                    owner.uploadImageToS3(presignedDatas: datas, imageDatas: imageDatas)
                }, onFailure: { owner, error  in
                    debugPrint("⚠️Bugreport uploadImage Error: \(error.localizedDescription)")
                    owner.isLoading = false
                    owner.bugImageUrl = [""]
                    owner.isEmpty = true
                }
            ).disposed(by: disposeBag)
    }

    private func uploadImageToS3(
        presignedDatas: [PresigedUrlEntity],
        imageDatas: [Data]
    ) {
        uploadImageToS3UseCase
            .excute(presigedDatas: presignedDatas, imageDatas: imageDatas)
            .subscribe(
                with: self,
                onCompleted: { owner in
                    owner.isLoading = false
                    owner.bugImageUrl = presignedDatas.map { $0.url }
                    owner.isEmpty = false
                }, onError: { owner, error in
                    debugPrint("⚠️Bugreport uploadImageToS3 Error: \(error.localizedDescription)")
                    owner.isLoading = false
                    owner.isEmpty = true
                }
            ).disposed(by: disposeBag)
    }

    func postBug() {
        checkBugPlace()
        postBugReportUseCase.excute(
            reason: content,
            category: catagory,
            imageUrl: bugImageUrl
        ).subscribe(onCompleted: {
            self.viewAppear()
            self.isSuccess = true
        }).disposed(by: disposeBag)
    }

    func viewAppear() {
        self.content = ""
        self.isLoading = false
        self.bugPlace = "홈"
        self.catagory = .home
        self.checkBugPlaceAndContentIsEmpty()
        self.isEmpty = true
        self.bugImageUrl = [""]
    }

    private func checkBugPlace() {
        switch bugPlace {
        case "신청":
            self.catagory = .application
        case "전체":
            self.catagory = .all
        case "피드":
            self.catagory = .feed
        case "일정":
            self.catagory = .schedule
        default:
            self.catagory = .home
        }
    }
}
