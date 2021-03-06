import ProjectDescription

extension TargetDependency {
    
    public struct Module {
        public static let DateUtilModule = module(name: "DateUtilModule")
        public static let KeychainModule = module(name: "KeychainModule")
        public static let RestApiMoudle = module(name: "RestApiModule")
        public static let RxOfflineCacheModule = module(name: "RxOfflineCacheModule")
    }

    private static func module(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("Modules/\(name)")
        )
    }

}
