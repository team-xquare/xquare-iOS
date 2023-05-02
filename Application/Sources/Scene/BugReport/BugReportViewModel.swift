import Foundation
import UIKit
import BugService
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
    var catagory = "HOME"
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
                print($0)
                self.isLoading = false
                self.bugImageUrl = $0
            }, onFailure: { _ in
                self.isLoading = false
                self.networking = true
                self.bugImage = UIImage()
            }).disposed(by: disposeBag)
    }
    func postBug() {
        postBugReportUseCase.excute(data: .init(
            reason: content,
            category: catagory,
            imageUrls: bugImageUrl)
        ).subscribe(onCompleted: {
            self.viewAppear()
        }, onError: {
            print(self.catagory)
            print($0)
            self.networking = true
        }).disposed(by: disposeBag)
    }
    func viewAppear() {
        self.content = ""
        self.isLoading = false
        self.bugPlace = "홈"
        self.catagory = "HOME"
        self.checkBugPlaceAndContentIsEmpty()
    }
    func checkCategory(cata: String) {
        switch cata {
        case "피드":
            catagory = "FEED"
        case "일정":
            catagory = "SCHEDULE"
        case "신청":
            catagory = "APPLICATION"
        case "전체":
            catagory = "ALL"
        default:
            catagory = "HOME"
        }
    }
}
