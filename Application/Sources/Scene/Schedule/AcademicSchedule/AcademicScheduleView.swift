import SwiftUI

import SemicolonDesign

struct AcademicScheduleView: View {
    @StateObject var viewModel: AcademicScheduleViewModel
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
                    ForEach(viewModel.schedule, id: \.date) {
                        AcademicScheduleCell(schedule: $0)
                    }
                }
            }
            NavigationLink(destination: writeScheduleView) {
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 22.4, height: 22.4)
                    .foregroundColor(.white)
                    .frame(width: 56, height: 56)
                    .background(Color.Primary.purple400)
                    .cornerRadius(28)
                    .shadow(radius: 4, x: 0, y: 4)
            }
            .padding(.trailing, 16)
        }
        .onAppear(perform: viewModel.fetchScheduleForMonth)
    }
}
