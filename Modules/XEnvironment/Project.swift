import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "XEnvironment",
    platform: .iOS,
    infoPlist: .file(path: "SupportingFiles/Info.plist"),
    configurations: [
        .debug(name: "DEV", xcconfig: .relativeToRoot("Configurations/develop.xcconfig")),
        .release(name: "STAGE", xcconfig: .relativeToRoot("Configurations/stage.xcconfig")),
        .release(name: "PROD", xcconfig: .relativeToRoot("Configurations/product.xcconfig"))
    ],
    dependencies: []
)
