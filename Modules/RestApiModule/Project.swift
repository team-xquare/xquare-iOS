import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "RestApiModule",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Service.AuthService,
        .Module.KeychainModule,
        .Module.XEnvironment,
        .SPM.Moya
    ]
)
