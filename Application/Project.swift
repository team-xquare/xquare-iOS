import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "XQUARE-iOS",
    organizationName: xquareOrganizationName,
    settings: .settings(base: .codeSign, configurations: [
        .debug(name: "DEV", xcconfig: .relativeToRoot("Configurations/develop.xcconfig")),
        .release(name: "STAGE", xcconfig: .relativeToRoot("Configurations/stage.xcconfig")),
        .release(name: "PROD", xcconfig: .relativeToRoot("Configurations/product.xcconfig"))
    ]),
    targets: [
        Target(
            name: "XQUARE-iOS",
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
            entitlements: Path("SupportingFiles/XQUARE-iOS.entitlements"),
            scripts: [.swiftLintScript, .googleInfoPlistScripts],
            dependencies: [
                .Module.XNavigationAndTab,
                .Module.XWebKit,
                .Service.AuthService,
                .Service.MealDataService,
                .SPM.FirebaseMessaging,
                .SPM.SemicolonDesign,
                .target(name: "XquareWidget")
            ] + TargetDependency.universalDependencies,
            settings: .settings(base: ["OTHER_LDFLAGS": "-ObjC"]),
            environment: ["OS_ACTIVITY_MODE": "disable"]
        ),
        Target(
            name: "XquareWidget",
            platform: .iOS,
            product: .appExtension,
            bundleId: "$(APP_BUNDLE_ID).WidgetExtension",
            infoPlist: .file(path: Path("Widget/SupportingFiles/Info.plist")),
            sources: "Widget/Sources/**",
            resources: "Widget/Resources/**",
            dependencies: [
                .SPM.SemicolonDesign
            ]
        )
    ],
    schemes: [
        Scheme(
            name: "XQUARE-iOS(DEV)",
            shared: true,
            buildAction: BuildAction(targets: ["XQUARE-iOS"]),
            runAction: .runAction(configuration: "DEV"),
            archiveAction: .archiveAction(configuration: "DEV"),
            profileAction: .profileAction(configuration: "DEV"),
            analyzeAction: .analyzeAction(configuration: "DEV")
        ),
        Scheme(
            name: "XQUARE-iOS(STAGE)",
            shared: true,
            buildAction: BuildAction(targets: ["XQUARE-iOS"]),
            runAction: .runAction(configuration: "STAGE"),
            archiveAction: .archiveAction(configuration: "STAGE"),
            profileAction: .profileAction(configuration: "STAGE"),
            analyzeAction: .analyzeAction(configuration: "STAGE")
        ),
        Scheme(
            name: "XQUARE-iOS(PROD)",
            shared: true,
            buildAction: BuildAction(targets: ["XQUARE-iOS"]),
            runAction: .runAction(configuration: "PROD"),
            archiveAction: .archiveAction(configuration: "PROD"),
            profileAction: .profileAction(configuration: "PROD"),
            analyzeAction: .analyzeAction(configuration: "PROD")
        )
    ]
)
