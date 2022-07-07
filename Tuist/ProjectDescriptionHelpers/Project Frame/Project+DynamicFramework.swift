import ProjectDescription

extension Project {

    public static func dynamicFramework(
        name: String,
        platform: Platform,
        infoPlist: InfoPlist = .default,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            settings: .settings(base: .codeSign),
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(xquareOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: [.iphone, .ipad]
                    ),
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    scripts: [
                        .swiftLintScript,
                        .removeStaticFrameworksScripts
                    ],
                    dependencies: dependencies + TargetDependency.universalDependencies
                ),
                Target(
                    name: name+"Test",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(xquareOrganizationName).\(name)Test",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: [.iphone, .ipad]
                    ),
                    sources: ["Tests/**"],
                    scripts: [.swiftLintScript],
                    dependencies: [
                        .target(name: name),
                        .SPM.Quick,
                        .SPM.Nimble,
                        .SPM.RxBlocking,
                        .SPM.RxNimble
                    ]
                )
            ]
        )
    }

}
