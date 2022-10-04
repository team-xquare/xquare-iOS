import ProjectDescription

extension Project {

    public static func framework(
        name: String,
        platform: Platform,
        isTestable: Bool = true,
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
                    scripts: [.swiftLintScript],
                    dependencies: dependencies + TargetDependency.universalDependencies
                )
            ] + getTestTargetIfNeed(name: name, isTestable: isTestable, platform: platform)
        )

    }

    private static func getTestTargetIfNeed(
        name: String,
        isTestable: Bool,
        platform: Platform
    ) -> [Target] {
        guard isTestable else { return [] }
        return [
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
    }

}
