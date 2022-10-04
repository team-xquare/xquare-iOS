import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "KeychainModule",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .SPM.KeychainSwift
    ]
)
