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
            settings: .settings(base: .codeSign),
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(xquareOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: deploymentDevice
                    ),
                    infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    entitlements: Path("SupportingFiles/\(name).entitlements"),
                    scripts: [.swiftLintScript],
                    dependencies: dependencies + TargetDependency.universalDependencies,
                    settings: .settings(base: [
                        "OTHER_LDFLAGS": "-ObjC"
                    ])
                )
            ]
        )
    }

}
