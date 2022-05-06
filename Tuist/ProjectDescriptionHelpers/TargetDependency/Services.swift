import ProjectDescription

extension TargetDependency {
    
    public struct Service {
        public static let AuthService = service(name: "AuthService")
        public static let MealDataService = service(name: "MealDataService")
    }

    private static func service(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("Services/\(name)")
        )
    }

}
