import ProjectDescription

extension Project {

    public static func excutable(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> Project {
        
        return Project(
            name: name,
            organizationName: xquareOrganizationName,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .app,
                    bundleId: "\(xquareOrganizationName).\(name)",
                    infoPlist: .extendingDefault(
                        with: [
                            "CFBundleShortVersionString": "1.0",
                            "CFBundleVersion": "1",
                            "UIMainStoryboardFile": "",
                            "UILaunchStoryboardName": "LaunchScreen"
                        ]
                    ),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    scripts: [swiftLintScripts],
                    dependencies: dependencies
                ),
                Target(
                    name: "\(name)Tests",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(xquareOrganizationName).\(name)Test",
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    scripts: [swiftLintScripts],
                    dependencies: [
                        .target(name: name)
                    ]
                )
            ]
        )
    }

}
