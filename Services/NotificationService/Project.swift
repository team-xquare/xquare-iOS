import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "NotificationService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle
    ])
