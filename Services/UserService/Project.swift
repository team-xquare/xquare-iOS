import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "UserService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.XOfflineCache
    ]
)
