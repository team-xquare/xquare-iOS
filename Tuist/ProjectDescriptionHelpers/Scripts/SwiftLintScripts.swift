import ProjectDescription

extension TargetScript {
    public static let swiftLintScript = TargetScript.pre(
        script: """
                lintableFileCount=`ls -1 *.swift 2>/dev/null | wc -l`
                if [ $lintableFileCount != 0 ]
                then
                    if test -d "/opt/homebrew/bin/"; then
                        PATH="/opt/homebrew/bin/:${PATH}"
                    fi

                    export PATH

                    if which swiftlint >/dev/null; then
                        swiftlint
                    else
                        echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
                    fi
                else
                    echo "No lintable files to check, skipping Swiftlint"
                fi
                """,
        name: "SwiftLint",
        basedOnDependencyAnalysis: false
    )
}
