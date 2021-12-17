import ProjectDescription

extension Project {

    public static func excutable(
        name: String,
        platform: Platform,
        product: Product = .app,
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
                    infoPlist: .file(path: Path("Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    scripts: [swiftLintScripts],
                    dependencies: dependencies
                )
            ],
            additionalFiles: [
                "SupportingFiles/**",
            ]
        )
    }

}
