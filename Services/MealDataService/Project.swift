import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "MealDataService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.RxOfflineCacheModule,
        .Module.XDateUtil,
        .Service.AuthService
    ]
)
