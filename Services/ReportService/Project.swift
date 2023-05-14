import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "ReportService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle
    ])
