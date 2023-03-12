import WidgetKit
import SwiftUI

import RxSwift
import XDateUtil
import ScheduleService
import SemicolonDesign

struct XquareScheduleWidgetProvider: TimelineProvider {

    private let fetchScheduleUseCase: FetchSchedulePerMonthUseCase
    private var disposeBag = DisposeBag()

    init() {
        self.fetchScheduleUseCase = ScheduleServiceDependency.shared.fetchScheduleForMonthUseCase
    }

    func placeholder(in context: Context) -> ScheduleEntry {
        return .init(date: Date(), schedule: [])
    }

    func getSnapshot(in context: Context, completion: @escaping (ScheduleEntry) -> Void) {
        getSchedule { schedule in
            completion(.init(date: Date(), schedule: schedule))
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ScheduleEntry>) -> Void) {
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!

        getSchedule { schedule in
            completion(.init(entries: [.init(date: Date(), schedule: schedule)], policy: .after(refreshDate)))
        }
    }

    private func getSchedule(completion: @escaping (([ScheduleEntity]) -> Void)) {
        let today = Date().toString(format: .fullDate)

        self.fetchScheduleUseCase.excute(month: Date())
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: {
                let schedule = $0.filter { $0.date == today.toDate(format: .fullDate) }
                completion(schedule)
            })
            .disposed(by: disposeBag)
    }
}

struct ScheduleEntry: TimelineEntry {
    var date: Date

    var schedule: [ScheduleEntity]
}

struct XquareScheduleWidgetEntryView: View {
    var entry: XquareScheduleWidgetProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(entry.date.toString(format: "E요일"))
                .sdText(type: .caption, textColor: .black)
            Text(entry.date.toString(format: "dd일"))
                .sdText(type: .heading4, textColor: .black)
                .padding(.bottom, 5)
            if entry.schedule != [] {
                ForEach(entry.schedule, id: \.id) { schedule in
                    LazyVStack {
                        ScheduleWidgetCell(schedule: schedule.name)
                            .padding(.bottom, 4)
                    }
                }
            } else {
                ScheduleWidgetCell(schedule: "일정이 없습니다.")
            }
            Spacer()
        }
        .padding([.top, .leading], 16)
    }
}

struct XquareScheduleWidget: Widget {
    let kind: String = "XquareScheduleWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: XquareScheduleWidgetProvider()) { entry in
            XquareScheduleWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("XQuare Schedule Widget")
        .description("Xquare 위젯을 통해 오늘 하루 일정을 확인하세요.")
        .supportedFamilies([.systemSmall])
    }
}
