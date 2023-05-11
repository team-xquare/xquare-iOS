import Foundation
import UIKit
import ReportService
import RxSwift
import AttachmentService
class BugReportViewModel: ObservableObject {
    @Published var bugPlace: String = "홈"
    @Published var content: String = ""
    @Published var isDisabled: Bool = true
    @Published var networking: Bool = false
    @Published var bugImageUrl = [""]
    @Published var bugImage: UIImage = UIImage()
    @Published var xPhotosIsPresented: Bool = false
    @Published var isLoading: Bool = false
    @Published var isEmpty: Bool = false
    var catagory: BugCategory = .home
    private let postBugReportUseCase: PostBugReportUseCase
    private let uploadImageUseCase: UploadImageUseCase

    private var disposeBag = DisposeBag()

    init(
        postBugReportUseCase: PostBugReportUseCase,
        uploadImageUseCase: UploadImageUseCase
    ) {
        self.postBugReportUseCase = postBugReportUseCase
        self.uploadImageUseCase = uploadImageUseCase
    }

    func checkBugPlaceAndContentIsEmpty() {
        isDisabled = bugPlace.isEmpty || content.isEmpty
    }
    func uploadImage() {
        self.uploadImageUseCase
            .excute(files: [self.bugImage.jpegData(compressionQuality: 0.5) ?? Data()])
            .subscribe(onSuccess: {
                self.isLoading = false
                self.bugImageUrl = $0
                self.isEmpty = false
            }, onFailure: { _ in
                self.isLoading = false
                self.bugImageUrl = [""]
                self.isEmpty = true
            }).disposed(by: disposeBag)
    }
    func postBug() {
        checkBugPlace()
        postBugReportUseCase.excute(
            reason: content,
            category: catagory,
            imageUrl: bugImageUrl
        ).subscribe(onCompleted: {
            self.viewAppear()
            self.networking = true
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
            self.catagory = .all
        }
    }
}
