import ProjectDescription

extension TargetScript {
    public static let swiftLintScripts = TargetScript.pre(
        script: "mint run swiftlint",
        name: "SwiftLint"
    )
}
