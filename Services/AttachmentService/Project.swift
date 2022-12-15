import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "AttachmentService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle
    ])
