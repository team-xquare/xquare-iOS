import ProjectDescription

extension Project {

    public static func dynamicFramework(
        name: String,
        platform: Platform,
        infoPlist: InfoPlist,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .framework,
                    bundleId: "\(xquareOrganizationName).\(name)",
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    dependencies: dependencies
                ),
                Target(
                    name: name+"Test",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(xquareOrganizationName).\(name)Test",
                    dependencies: [
                        .target(name: name)
                    ]
                )
            ],
            schemes: [
                
            ]
        )
    }

}
