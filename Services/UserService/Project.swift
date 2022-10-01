import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "UserService",
    platform: .iOS,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.RxOfflineCacheModule
    ]
)
