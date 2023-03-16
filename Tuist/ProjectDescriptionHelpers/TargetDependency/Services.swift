import ProjectDescription

extension TargetDependency {
    
    public struct Service {
        public static let AuthService = service(name: "AuthService")
        public static let MealDataService = service(name: "MealDataService")
        public static let UserService = service(name: "UserService")
        public static let AttachmentService = service(name: "AttachmentService")
        public static let ScheduleService = service(name:"ScheduleService")
        public static let TimeTableService = service(name: "TimeTableService")
        public static let PointService = service(name: "PointService")
        public static let PickService = service(name: "PickService")
    }

    private static func service(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("Services/\(name)")
        )
    }

}
