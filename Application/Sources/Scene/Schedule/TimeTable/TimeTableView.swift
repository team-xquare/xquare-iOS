import SwiftUI

import TimeTableService

struct TimeTableView: View {
    @StateObject var viewModel: TimeTableViewModel

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 62)
            TabView {
                ForEach(viewModel.timeTable, id: \.weekDay) { weekTimeTable in
                    List(weekTimeTable.dayTimeTable, id: \.period) { timeTable in
                        TimeTableCell(timeTable: timeTable)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.inset)
                }
            }
            .tabViewStyle(.page)
        }
        .onAppear(perform: viewModel.fetchTimeTable)
    }
}
