import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "KeychainModule",
    platform: .iOS,
    dependencies: [
        .SPM.KeychainSwift
    ]
)
