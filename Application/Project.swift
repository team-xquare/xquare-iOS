import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
    name: "XQUARE-iOS",
    platform: .iOS,
    dependencies: [
        .Module.XWebKit,
        .Service.AuthService,
        .Service.MealDataService,
        .SPM.SemicolonDesign
    ]
)
