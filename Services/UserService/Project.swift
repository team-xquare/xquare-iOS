import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "UserSerevice",
    platform: .iOS,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.RxOfflineCacheModule
    ]
)
