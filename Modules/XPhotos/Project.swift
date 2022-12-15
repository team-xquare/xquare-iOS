import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "XPhotos",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .SPM.SemicolonDesign
    ]
)
