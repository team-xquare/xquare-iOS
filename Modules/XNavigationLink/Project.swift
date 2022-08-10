import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "XNavigationLink",
    platform: .iOS,
    dependencies: [
        .SPM.Introspect
    ]
)
