import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "XWebKitDemoApp",
    organizationName: xquareOrganizationName,
    settings: .settings(base: .codeSign, configurations: [.debug(name: "DEV")]),
    targets: [
        Target(
            name: "XWebKitDemoApp",
            platform: .iOS,
            product: .app,
            bundleId: "$(APP_BUNDLE_ID)",
            deploymentTarget: .iOS(
                targetVersion: "15.0",
                devices: .iphone
            ),
            infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            scripts: [.swiftLintScript],
            dependencies: [
                .SPM.XWebKit
            ] + TargetDependency.universalDependencies,
            settings: .settings(base: ["OTHER_LDFLAGS": "-ObjC"])
        )
    ],
    schemes: [
        Scheme(
            name: "XWebKitDemoApp",
            shared: true,
            buildAction: BuildAction(targets: ["XWebKitDemoApp"]),
            runAction: .runAction(
                configuration: "DEV",
                arguments: Arguments(environment: ["OS_ACTIVITY_MODE": "disable"])
            ),
            archiveAction: .archiveAction(configuration: "DEV"),
            profileAction: .profileAction(configuration: "DEV"),
            analyzeAction: .analyzeAction(configuration: "DEV")
        )
    ]
)
