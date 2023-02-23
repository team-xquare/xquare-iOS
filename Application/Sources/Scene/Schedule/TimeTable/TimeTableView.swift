import SwiftUI

import SemicolonDesign
import TimeTableService

struct TimeTableView: View {
    @StateObject var viewModel: TimeTableViewModel
    @State var weekDay: Int = 1

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 16)
            TabView(selection: $weekDay) {
                ForEach(viewModel.timeTable, id: \.weekDay) { weekTimeTable in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(weekTimeTable.date.toString(format: "MM월 dd일 (E)"))
                            .sdText(type: .body2, textColor: .GrayScale.gray900)
                            .padding(.bottom, 16)
                        List(weekTimeTable.dayTimeTable, id: \.period) { timeTable in
                            TimeTableCell(timeTable: timeTable)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                                .padding(.bottom, 18)
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 24)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .tabViewStyle(.page)

            PageControlView(weekDay: $weekDay)
                .padding(.vertical, 20)
        }
        .onAppear(perform: viewModel.fetchTimeTable)
    }
}
