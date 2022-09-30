import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "XNavigationAndTab",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .SPM.SemicolonDesign
    ]
)
