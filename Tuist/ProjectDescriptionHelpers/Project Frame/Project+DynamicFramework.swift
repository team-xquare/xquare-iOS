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
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    scripts: [.swiftLintScripts],
                    dependencies: dependencies + TargetDependency.universalDependencies
                ),
                Target(
                    name: name+"Test",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(xquareOrganizationName).\(name)Test",
                    scripts: [.swiftLintScripts],
                    dependencies: [
                        .target(name: name),
                        .SPM.RxTest
                    ]
                )
            ]
        )
    }

}
