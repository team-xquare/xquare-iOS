import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "XWebKit",
    platform: .iOS,
    dependencies: [
        .Module.XNavigationLink,
        .SPM.RxWebKit,
        .SPM.SemicolonDesign
    ]
)
