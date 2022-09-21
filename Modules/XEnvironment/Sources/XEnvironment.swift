import Foundation

public enum XEnvironment {

    // MARK: - Keys
    public enum Keys: String {
        case apiBaseUrl = "API_BASE_URL"
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle(identifier: "com.xquare.XEnvironment")?.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    // MARK: - Get Value
    public static func getValue(key: Keys) -> String? {
        return XEnvironment.infoDictionary[key.rawValue] as? String
    }

}
