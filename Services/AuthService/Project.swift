import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "AuthService",
    platform: .iOS,
    dependencies: [
        .Module.DateUtilModule,
        .Module.KeychainModule,
        .SPM.Moya,
        .SPM.RxMoya
    ]
)
