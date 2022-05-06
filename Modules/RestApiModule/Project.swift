import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "RestApiModule",
    platform: .iOS,
    dependencies: [
        .Service.AuthService,
        .Module.KeychainModule,
        .SPM.Moya
    ]
)
