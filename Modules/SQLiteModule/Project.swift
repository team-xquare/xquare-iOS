import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "SQLiteModule",
    platform: .iOS,
    dependencies: [
        .SPM.SQLite
    ]
)
