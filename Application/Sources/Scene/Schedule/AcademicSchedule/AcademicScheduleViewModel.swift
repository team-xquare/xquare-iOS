import Foundation

import RxSwift
import ScheduleService

class AcademicScheduleViewModel: ObservableObject {
    @Published var day = Date()
    @Published var schedule: [ScheduleEntity] = []
    @Published var scheduleId: String = ""
    @Published var errorMessage: String = ""
    @Published var title: String = ""
    @Published var date: String = ""
    @Published var isDismiss: Bool = false
    @Published var showErrorAlert: Bool = false

    private let fetchSchedulePerMonthUseCase: FetchSchedulePerMonthUseCase
    private let editScheduleUseCase: EditScheduleUseCase
    private let deleteScheduleUseCase: DeleteScheduleUseCase

    private var disposeBag = DisposeBag()

    init(
        fetchSchedulePerMonthUseCase: FetchSchedulePerMonthUseCase,
        editScheduleUseCase: EditScheduleUseCase,
        deleteScheduleUseCase: DeleteScheduleUseCase
    ) {
        self.fetchSchedulePerMonthUseCase = fetchSchedulePerMonthUseCase
        self.editScheduleUseCase = editScheduleUseCase
        self.deleteScheduleUseCase = deleteScheduleUseCase
    }

    func fetchScheduleForMonth() {
        self.fetchSchedulePerMonthUseCase.excute(month: day)
            .subscribe(onNext: {
                self.schedule = $0
            })
            .disposed(by: disposeBag)
    }

    func editSchedule() {
        self.editScheduleUseCase.excute(scheduleId: scheduleId, name: title, date: date)
            .subscribe(onCompleted: {
                self.isDismiss = true
            }, onError: {
                if $0.asScheduleServiceError == .isNotPersonalSchedule {
                    self.errorMessage = "개인 일정 외 학사 일정은 수정할 수 없습니다."
                    self.showErrorAlert = true
                    self.isDismiss = true
                }
            })
            .disposed(by: disposeBag)
    }

    func deleteSchedule() {
        self.deleteScheduleUseCase.excute(scheduleId: scheduleId)
            .subscribe(onCompleted: {
                self.schedule = self.schedule.filter { $0.id != self.scheduleId }
            }, onError: {
                if $0.asScheduleServiceError == .isNotPersonalSchedule {
                    self.errorMessage = "개인 일정 외 학사 일정은 삭제할 수 없습니다."
                    self.showErrorAlert = true
                }
            })
            .disposed(by: disposeBag)
    }
}
