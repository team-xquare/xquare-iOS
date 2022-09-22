import WidgetKit
import SwiftUI

import SemicolonDesign

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
}

struct XquareWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        Image("Logo")
            .resizable()
            .frame(width: 180, height: 180)
            .cornerRadius(5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Primary.purple400)
    }
}

@main
struct XquareWidget: Widget {
    let kind: String = "XQUARE_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            XquareWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Widget")
        .description("🛠 개발중입니다...")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct XquareWidgetPreviews: PreviewProvider {
    static var previews: some View {
        XquareWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
