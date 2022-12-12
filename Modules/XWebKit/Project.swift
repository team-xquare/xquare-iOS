import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "XWebKit",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.XNavigationAndTab,
        .Module.XPhotos,
        .SPM.RxCocoa,
        .SPM.SemicolonDesign
    ]
)
