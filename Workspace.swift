import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "XQUARE-Workspace",
    projects: [
        "Application",
        "DemoApps/**",
        "Services/**",
        "Modules/**"
    ],
    fileHeaderTemplate: nil,
    additionalFiles: []
)
