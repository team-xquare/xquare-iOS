import Foundation

class AcademicScheduleViewModel: ObservableObject {
    @Published var day = Date()
    @Published var specialDays: [Date] = []
}
