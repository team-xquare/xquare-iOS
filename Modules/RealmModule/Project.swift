import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "RealmModule",
    platform: .iOS,
    dependencies: [
        .SPM.Realm
    ]
)
