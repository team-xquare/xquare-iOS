import SwiftUI

import TimeTableService
import ScheduleService

class ScheduleRouterFactory: RouterFactory {

    let scheduleView: ScheduleView
    let writeScheduleView: WriteScheduleView

    init() {
        let timeTableServiceDependency = TimeTableServiceDependency.shared
        let scheduleServiceDependency = ScheduleServiceDependency.shared

        let timeTableViewModel = TimeTableViewModel(
            fetchTimeTableForWeekUseCase: timeTableServiceDependency.fetchTimeTableForWeekUseCase
        )
        let timeTableView = TimeTableView(viewModel: timeTableViewModel)
        let academicScheduleViewModel = AcademicScheduleViewModel(
            fetchSchedulePerMonthUseCase: scheduleServiceDependency.fetchScheduleForMonthUseCase,
            editScheduleUseCase: scheduleServiceDependency.editScheduleUseCase,
            deleteScheduleUseCase: scheduleServiceDependency.deleteScheduleUseCase
        )
        let academicScheduleView = AcademicScheduleView(viewModel: academicScheduleViewModel)

        self.scheduleView = ScheduleView(timeTableView: timeTableView, academicScheduleView: academicScheduleView)

        let writeScheduleViewModel = WriteScheduleViewModel(
            createScheduleUseCase: scheduleServiceDependency.createScheduleUseCase
        )
        self.writeScheduleView = WriteScheduleView(viewModel: writeScheduleViewModel)
    }

    @ViewBuilder func makeBody(for screen: ScheduleRoute) -> some View {
        switch screen {
        case .schedule:
            self.scheduleView
        case .writeSchedule:
            self.writeScheduleView
        }
    }
}
