import ProjectDescription

extension Project {

    public static func excutable(
        name: String,
        platform: Platform,
        product: Product = .app,
        infoPlist: InfoPlist = .default,
        dependencies: [TargetDependency]
    ) -> Project {
        
        return Project(
            name: name,
            organizationName: xquareOrganizationName,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(xquareOrganizationName).\(name)",
                    infoPlist: infoPlist,
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
