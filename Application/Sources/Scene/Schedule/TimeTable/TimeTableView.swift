import SwiftUI

import SemicolonDesign
import TimeTableService

struct TimeTableView: View {
    @StateObject var viewModel: TimeTableViewModel

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 16)
            TabView {
                ForEach(viewModel.timeTable, id: \.weekDay) { weekTimeTable in
                    Text(weekTimeTable.date.toString(format: "MM월 dd일 (E)"))
                        .sdText(type: .body2, textColor: .GrayScale.gray900)
                        .padding(.bottom, 16)
                    List(weekTimeTable.dayTimeTable, id: \.period) { timeTable in
                        TimeTableCell(timeTable: timeTable)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.inset)
                }
            }
            .tabViewStyle(.page)
        }
        .padding(.horizontal, 24)
        .onAppear(perform: viewModel.fetchTimeTable)
    }
}
