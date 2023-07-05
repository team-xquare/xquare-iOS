import WidgetKit
import SwiftUI

import RxSwift
import XDateUtil
import MealDataService
import SemicolonDesign

struct XquareMealWidgetProvider: TimelineProvider {

    private let fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase
    private var disposeBag = DisposeBag()

    init() {
        self.fetchMealMenuPerDayUseCase = MealDataServiceDependency.shared.fetchDayToMealMenuUseCase
    }

    func placeholder(in context: Context) -> MealEntry {
        MealEntry(
            date: Date(),
            meal: .init(date: Date().toString(format: .fullDate), menu: []),
            mealTime: getMealTime()
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (MealEntry) -> Void) {
        getMeal { meal in
            completion(.init(date: Date(), meal: meal, mealTime: getMealTime()))
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MealEntry>) -> Void) {
        let refreshDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!

        getMeal { meal in
            completion(.init(
                entries: [.init(date: Date(), meal: meal, mealTime: getMealTime())],
                policy: .after(refreshDate))
            )
        }
    }

    private func getMeal(completion: @escaping ((MealMenuPerDayEntity) -> Void)) {
        self.fetchMealMenuPerDayUseCase.excute(date: Date())
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: {
                completion($0)
            })
            .disposed(by: disposeBag)
    }

    private func getMealTime() -> MealTime {
        if 9 > Int(Date().toString(format: "HH"))! {
            return .breakfast
        } else if 13 > Int(Date().toString(format: "HH"))! {
            return .lunch
        } else {
            return .dinner
        }
    }
}

struct MealEntry: TimelineEntry {
    var date: Date
    var meal: MealMenuPerDayEntity
    var mealTime: MealTime
}

struct XquareMealWidgetEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: XquareMealWidgetProvider.Entry

    var body: some View {
        widgetBody()
    }

    @ViewBuilder
    func widgetBody() -> some View {
        switch widgetFamily {
        case .systemSmall:
            SmallXquareMealWidgetView(entry: entry)
        case .systemMedium:
            MediumXquareMealWidgetView(entry: entry)
        case .accessoryRectangular:
            RectangularXquareMealWidgetView(entry: entry)
        default:
            EmptyView()
        }
    }

}

struct SmallXquareMealWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: XquareMealWidgetProvider.Entry
    var mealMenu: MealMenuEntity?

    init(entry: XquareMealWidgetProvider.Entry) {
        self.entry = entry
        self.mealMenu = entry.meal.menu.first { $0.mealTime == entry.mealTime }
    }

    var body: some View {
        ZStack {
            if colorScheme == .light {
                Color.white.ignoresSafeArea()
            } else {
                Color.GrayScale.gray900.ignoresSafeArea()
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(entry.mealTime.rawValue)
                    .sdText(
                        type: .body4,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
                    .padding(.trailing, 10)
                    .padding(.top, 3)
                Text(entry.date.toString(format: .fullDate))
                    .sdText(
                        type: .caption2,
                        textColor: colorScheme == .light ? .GrayScale.gray600 : .GrayScale.gray500
                    )
                    .padding(.bottom, 10)
                if mealMenu?.menu ?? [] != [""] && mealMenu?.menu != nil {
                    Text("\(mealMenu?.menu?.joined(separator: ", ") ?? "") (\(mealMenu?.kcal ?? ""))")
                        .sdText(
                            type: .caption2,
                            textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                        )
                        .lineLimit(nil)
                } else {
                    Text("등록된 정보가 없습니다.")
                        .sdText(
                            type: .caption2,
                            textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                        )
                }
                Spacer()
            }
            .padding(10)
        }
    }
}

struct MediumXquareMealWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: XquareMealWidgetProvider.Entry
    var mealMenu: MealMenuEntity?

    init(entry: XquareMealWidgetProvider.Entry) {
        self.entry = entry
        self.mealMenu = entry.meal.menu.first { $0.mealTime == entry.mealTime }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
                .frame(height: 10)
            HStack(spacing: 0) {
                Text(entry.mealTime.rawValue)
                    .sdText(
                        type: .body4,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
                    .padding(.trailing, 10)
                Text(entry.date.toString(format: .fullDate))
                    .sdText(
                        type: .caption2,
                        textColor: colorScheme == .light ? .GrayScale.gray600 : .GrayScale.gray500
                    )
                Spacer()
            }
            .padding(.bottom, 10)
            if mealMenu?.menu ?? [] != [""] && mealMenu?.menu != nil {
                Text("\(mealMenu?.menu?.joined(separator: ", ") ?? "") (\(mealMenu?.kcal ?? ""))")
                    .sdText(
                        type: .caption2,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
            } else {
                Text("등록된 정보가 없습니다.")
                    .sdText(
                        type: .caption2,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
            }
            Spacer()
        }
        .padding(24)
        .background(colorScheme == .light ? .white : .GrayScale.gray900)
    }
}

struct RectangularXquareMealWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    var entry: XquareMealWidgetProvider.Entry
    var mealMenu: MealMenuEntity?

    init(entry: XquareMealWidgetProvider.Entry) {
        self.entry = entry
        self.mealMenu = entry.meal.menu.first { $0.mealTime == entry.mealTime }
    }

    var body: some View {
            if mealMenu?.menu ?? [] != [] {
                ZStack(alignment: .topLeading) {
                    Text("      \(mealMenu?.menu?.joined(separator: ", ") ?? "")")
                        .sdText(
                            type: .caption2,
                            textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                        )
                    nowToImage(mealTime: entry.mealTime)
                }
            } else {
                Text("등록된 정보가 없습니다.")
                    .sdText(
                        type: .caption2,
                        textColor: colorScheme == .light ? .GrayScale.gray900 : .GrayScale.gray100
                    )
            }
    }
    func nowToImage(mealTime: MealTime) -> Image {
        switch mealTime {
        case .breakfast:
            return Image(systemName: "sun.haze.fill")
        case .lunch:
            return Image(systemName: "sun.max.fill")
        case .dinner:
            return Image(systemName: "moon.stars.fill")
        }
    }
}

struct XquareMealWidget: Widget {
    let kind: String = "XquareMealWidget"

    var body: some WidgetConfiguration {
        let configuration = StaticConfiguration(
            kind: kind,
            provider: XquareMealWidgetProvider()
        ) { entry in
            XquareMealWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("급식")
        .description("Xquare 위젯을 통해 오늘 하루의 급식을 확인하세요.")

        if #available(iOSApplicationExtension 16.0, *) {
            return configuration
                .supportedFamilies([.systemSmall, .systemMedium, .accessoryRectangular])
        } else {
            return configuration
                .supportedFamilies([.systemSmall, .systemMedium])
        }
    }
}
