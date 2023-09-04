import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "GithubService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle
    ]
)
