import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "AuthService",
    platform: .iOS,
    dependencies: [
        .Module.DateUtilModule,
        .Module.KeychainModule,
        .Module.XEnvironment,
        .SPM.Moya,
        .SPM.RxMoya
    ]
)
