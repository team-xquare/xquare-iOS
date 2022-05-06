import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "AuthService",
    platform: .iOS,
    dependencies: [
        .Module.KeychainModule,
        .SPM.Moya
    ]
)
