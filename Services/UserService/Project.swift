import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "UserSerevice",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.RxOfflineCacheModule
    ]
)
