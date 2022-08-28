import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "XWebKit",
    platform: .iOS,
    dependencies: [
        .Module.XNavigationAndTab,
        .SPM.RxWebKit,
        .SPM.SemicolonDesign
    ]
)
