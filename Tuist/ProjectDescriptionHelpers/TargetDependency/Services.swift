import ProjectDescription

extension TargetDependency {
    
    public struct Service {
        public static let AuthService = service(name: "AuthService")
        public static let MealDataService = service(name: "MealDataService")
        public static let UserService = service(name: "UserService")
        public static let AttachmentService = service(name: "AttachmentService")
    }

    private static func service(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("Services/\(name)")
        )
    }

}
