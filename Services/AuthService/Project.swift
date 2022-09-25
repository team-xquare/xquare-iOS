import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "AuthService",
    platform: .iOS,
    dependencies: [
        .Module.KeychainModule,
        .Module.XDateUtil,
        .Module.XEnvironment,
        .SPM.Moya,
        .SPM.RxMoya
    ]
)
