import SwiftUI

struct TimeTableView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 62)
            List(1..<8, id: \.self) { num in
                TimeTableCell(period: num)
                    .frame(height: 42)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .padding(.horizontal, 28)
        }
    }
}

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView()
    }
}
