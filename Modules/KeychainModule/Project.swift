import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "KeychainModule",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .SPM.KeychainSwift
    ]
)
