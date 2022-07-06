import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "MealDataService",
    platform: .iOS,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.RxOfflineCacheModule,
        .Service.AuthService
    ]
)
