import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
    name: "XQUARE",
    platform: .iOS,
    dependencies: [
        .project(target: "Service", path: "../Service")
    ]
)
