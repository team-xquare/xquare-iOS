import Foundation

extension String {
    func stringToPage() -> (Int?, XquareRoute?) {
        switch self {
        case "ALL_POINT":
            return (0, .pointHistory)
        case "APPLICATION_WEEKEND_MEAL", "APPLICATION_STAY", "APPLICATION_WEEKEND_PICNIC":
            return (3, nil)
        default:
            return (nil, nil)
        }
    }
}
