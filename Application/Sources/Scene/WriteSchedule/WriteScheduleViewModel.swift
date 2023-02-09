import Foundation

class WriteScheduleViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var day: String = ""
    @Published var postButtonIsDisabled: Bool = true
}
