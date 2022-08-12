import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "XNavigation",
    platform: .iOS,
    dependencies: [
        .SPM.Introspect
    ]
)
