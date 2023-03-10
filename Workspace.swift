import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "XQUARE-Workspace",
    projects: [
        "Application",
        "Services/**",
        "Modules/**"
    ],
    fileHeaderTemplate: nil,
    additionalFiles: []
)
