import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "MealDataService",
    platform: .iOS,
    dependencies: [
        .Module.RealmModle,
        .Module.RestApiMoudle,
        .Module.RxOfflineCacheModule
    ]
)
