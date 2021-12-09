import ProjectDescription

let swiftLintScripts = TargetScript.pre(
    script: "mint run swiftlint",
    name: "SwiftLint"
)
