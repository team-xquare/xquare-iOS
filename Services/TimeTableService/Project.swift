import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "TimeTableService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.XDateUtil
    ])
