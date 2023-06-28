import WidgetKit
import SwiftUI

import RxSwift
import XDateUtil
import TimeTableService
import SemicolonDesign

struct XquareTimeTableWidgetProvider: TimelineProvider {

    private let fetchTimeTableForWeekUseCase: FetchTimeTableForWeekUseCase
    private var disposeBag = DisposeBag()

    init() {
        self.fetchTimeTableForWeekUseCase = TimeTableServiceDependency.shared.fetchTimeTableForWeekUseCase
    }

    func placeholder(in context: Context) -> TimeTableEntry {
        return .init(weekDay: 1, date: Date(), dayTimeTable: [])
    }

    func getSnapshot(in context: Context, completion: @escaping (TimeTableEntry) -> Void) {
        getTimeTable { timeTable in
            completion(.init(weekDay: timeTable.weekDay, date: timeTable.date, dayTimeTable: timeTable.dayTimeTable))
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<TimeTableEntry>) -> Void) {
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date())!

        getTimeTable { timeTable in
            completion(.init(
                entries: [.init(
                    weekDay: timeTable.weekDay,
                    date: timeTable.date,
                    dayTimeTable: timeTable.dayTimeTable.filter {
                        return $0.period == (TimePeriod(date: Date()).rawValue + 1)
                    }
                )],
                policy: .after(refreshDate))
            )
        }
    }

    private func getTimeTable(completion: @escaping ((WeekTimeTableEntity) -> Void)) {
        self.fetchTimeTableForWeekUseCase.excute()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: {
                let timetable = $0.filter {
                    $0.weekDay == getWeekDay()
                }
                completion(timetable.first!)
            })
            .disposed(by: disposeBag)
    }
    private func getWeekDay() -> Int {
        return (Calendar.current.dateComponents([.weekday], from: Date()).weekday ?? 0) - 1
    }
}

struct TimeTableEntry: TimelineEntry {
    var weekDay: Int
    var date: Date
    var dayTimeTable: [DayTimeTableEntity]
}

struct XquareTimeTableWidgetEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: XquareTimeTableWidgetProvider.Entry

    var body: some View {
        widgetBody()
    }
    @ViewBuilder
    func widgetBody() -> some View {
        switch widgetFamily {
        case .systemSmall:
            RectangularXquareTimeTableWidgetView(entry: entry)
        case .accessoryRectangular:
            RectangularXquareTimeTableWidgetView(entry: entry)
        default:
            EmptyView()
        }
    }
}

struct RectangularXquareTimeTableWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    var entry: XquareTimeTableWidgetProvider.Entry

    init(entry: XquareTimeTableWidgetProvider.Entry) {
        self.entry = entry
    }

    var body: some View {
        if entry.dayTimeTable != [] {
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Text("\(entry.dayTimeTable.first!.period)교시")
                        .sdText(
                            type: .body1,
                            textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                        )
                    Spacer()
                }
                Text("\(entry.dayTimeTable.first!.subjectName)")
                    .sdText(
                        type: .body2,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
            }
        } else {
            Text("등록된 정보가 없습니다.")
                .sdText(
                    type: .caption2,
                    textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                )
        }
    }
}

struct SmallXquareTimeTableWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    var entry: XquareTimeTableWidgetProvider.Entry

    init(entry: XquareTimeTableWidgetProvider.Entry) {
        self.entry = entry
    }

    var body: some View {
        if entry.dayTimeTable != [] {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(entry.dayTimeTable.first!.period)교시")
                    .sdText(
                        type: .body3,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
                Text("\(entry.dayTimeTable.first!.subjectName)")
                    .sdText(
                        type: .body4,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
            }
        } else {
            Text("등록된 정보가 없습니다.")
                .sdText(
                    type: .caption2,
                    textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                )
        }
    }
}

struct XquareTimeTableWidget: Widget {
    let kind: String = "XquareTimeTableWidget"

    var body: some WidgetConfiguration {
        let configuration = StaticConfiguration(
            kind: kind,
            provider: XquareTimeTableWidgetProvider()
        ) { entry in
            XquareTimeTableWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("XQuare timeTable Widget")
        .description("Xquare 위젯을 통해 오늘 시간표를 확인하세요.")

        if #available(iOSApplicationExtension 16.0, *) {
            return configuration
                .supportedFamilies([.systemSmall, .accessoryRectangular])
        } else {
            return configuration
                .supportedFamilies([.systemSmall])
        }
    }
}
