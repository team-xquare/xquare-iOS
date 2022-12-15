import ProjectDescription

extension TargetDependency {
    
    public struct Module {
        public static let KeychainModule = module(name: "KeychainModule")
        public static let RestApiMoudle = module(name: "RestApiModule")
        public static let XDateUtil = module(name: "XDateUtil")
        public static let XEnvironment = module(name: "XEnvironment")
        public static let XNavigationAndTab = module(name: "XNavigationAndTab")
        public static let XOfflineCache = module(name: "XOfflineCache")
        public static let XPhotos = module(name: "XPhotos")
        public static let XWebKit = module(name: "XWebKit")
    }

    private static func module(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("Modules/\(name)")
        )
    }

}
