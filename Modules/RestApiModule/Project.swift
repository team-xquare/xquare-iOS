import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
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
