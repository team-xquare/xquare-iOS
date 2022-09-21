import ProjectDescription

extension Project {

    public static func dynamicFramework(
        name: String,
        platform: Platform,
        infoPlist: InfoPlist = .default,
        configurations: [Configuration] = [.debug(name: "DEV"), .release(name: "STAGE"), .release(name: "PROD")],
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            settings: .settings(base: .codeSign, configurations: configurations),
            targets: [
                Target(
                    name: name,
                    platform: platform,
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
