import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "XNavigationAndTab",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .SPM.SemicolonDesign
    ]
)
