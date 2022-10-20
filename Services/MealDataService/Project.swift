import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "MealDataService",
    platform: .iOS,
    isTestable: false,
    dependencies: [
        .Module.RestApiMoudle,
        .Module.XDateUtil,
        .Module.XOfflineCache
    ]
)
