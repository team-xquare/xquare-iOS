import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "PickService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle
    ])
