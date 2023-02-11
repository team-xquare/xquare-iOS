import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "ScheduleService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.XDateUtil,
        .Module.RestApiMoudle
    ]
)
