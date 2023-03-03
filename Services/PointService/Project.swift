import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "PointService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle
    ])
