import SwiftUI

import ScheduleService
import SemicolonDesign

struct AcademicScheduleView: View {
    @StateObject var viewModel: AcademicScheduleViewModel
    @State var isShowBottomSheet: Bool = false
    @State var moveEditScheduleView: Bool = false
    let writeScheduleView: WriteScheduleView

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    SDCalendar(
                        day: $viewModel.day,
                        specialDate: viewModel.schedule.map { $0.date }
                    )
                    .padding(.top, 18)
                    .padding(.bottom, 20)
                    ForEach(viewModel.schedule, id: \.id) {
                        if $0.date.toString(format: "yyyy MM") == viewModel.day.toString(format: "yyyy MM") {
                            AcademicScheduleCell(
                                schedule: $0,
                                isShowBottomSheet: $isShowBottomSheet,
                                scheduleId: $viewModel.scheduleId,
                                title: $viewModel.title,
                                day: $viewModel.date
                            )
                        }
                    }
                }
            }
            NavigationLink(destination: writeScheduleView) {
                Image.pencilIcon
                    .resizable()
                    .frame(width: 22.4, height: 22.4)
                    .frame(width: 56, height: 56)
                    .background(Color.Primary.purple400)
                    .cornerRadius(28)
                    .shadow(radius: 4, x: 0, y: 4)
            }
            .padding(.trailing, 16)
            NavigationLink(
                isActive: $moveEditScheduleView,
                destination: { EditScheduleView(
                    editScheudle: viewModel.editSchedule,
                    title: $viewModel.title,
                    day: $viewModel.date,
                    isSuccess: $viewModel.isDismiss
                ) },
                label: { EmptyView() }
            )
        }
        .onChange(of: viewModel.day) { _ in
            viewModel.fetchScheduleForMonth()
        }
        .sdOkayAlert(isPresented: $viewModel.showErrorAlert, sdAlert: {
            SDOkayAlert(title: "문제가 발생했습니다.", message: viewModel.errorMessage)
        })
        .sdBottomSheet(isPresented: $isShowBottomSheet) {
            SDBottomSheet(buttons: [
                (text: "수정하기", action: { self.moveEditScheduleView = true }),
                (text: "삭제하기", action: self.viewModel.deleteSchedule)
            ])
        }
        .onAppear(perform: viewModel.fetchScheduleForMonth)
    }
}
