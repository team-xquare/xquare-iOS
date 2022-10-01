import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "UserService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.RxOfflineCacheModule
    ]
)
