import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "XWebKit",
    platform: .iOS,
    dependencies: [
        .SPM.RxWebKit
    ]
)
