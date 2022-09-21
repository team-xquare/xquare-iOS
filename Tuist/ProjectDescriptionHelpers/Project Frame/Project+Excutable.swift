import ProjectDescription

extension Project {

    public static func excutable(
        name: String,
        platform: Platform,
        product: Product = .app,
        deploymentDevice: DeploymentDevice = [.iphone, .ipad],
        dependencies: [TargetDependency]
    ) -> Project {
        
        return Project(
            name: name,
            organizationName: xquareOrganizationName,
            settings: .settings(base: .codeSign, configurations: [
                .debug(name: "DEV", xcconfig: .relativeToRoot("Configurations/develop.xcconfig")),
                .release(name: "STAGE", xcconfig: .relativeToRoot("Configurations/stage.xcconfig")),
                .release(name: "PROD", xcconfig: .relativeToRoot("Configurations/product.xcconfig"))
            ]),
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "$(APP_BUNDLE_ID)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: deploymentDevice
                    ),
                    infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    entitlements: Path("SupportingFiles/\(name).entitlements"),
                    scripts: [.swiftLintScript, .googleInfoPlistScripts],
                    dependencies: dependencies + TargetDependency.universalDependencies,
                    settings: .settings(base: ["OTHER_LDFLAGS": "-ObjC"]),
                    environment: ["OS_ACTIVITY_MODE": "disable"]
                )
            ],
            schemes: [
                Scheme(
                    name: name+"(DEV)",
                    shared: true,
                    buildAction: BuildAction(targets: ["\(name)"]),
                    runAction: .runAction(configuration: "DEV"),
                    archiveAction: .archiveAction(configuration: "DEV"),
                    profileAction: .profileAction(configuration: "DEV"),
                    analyzeAction: .analyzeAction(configuration: "DEV")
                ),
                Scheme(
                    name: name+"(STAGE)",
                    shared: true,
                    buildAction: BuildAction(targets: ["\(name)"]),
                    runAction: .runAction(configuration: "STAGE"),
                    archiveAction: .archiveAction(configuration: "STAGE"),
                    profileAction: .profileAction(configuration: "STAGE"),
                    analyzeAction: .analyzeAction(configuration: "STAGE")
                ),
                Scheme(
                    name: name+"(PROD)",
                    shared: true,
                    buildAction: BuildAction(targets: ["\(name)"]),
                    runAction: .runAction(configuration: "PROD"),
                    archiveAction: .archiveAction(configuration: "PROD"),
                    profileAction: .profileAction(configuration: "PROD"),
                    analyzeAction: .analyzeAction(configuration: "PROD")
                ),
            ]
        )
    }

}
