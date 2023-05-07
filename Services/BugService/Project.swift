import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "BugService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle
    ])
