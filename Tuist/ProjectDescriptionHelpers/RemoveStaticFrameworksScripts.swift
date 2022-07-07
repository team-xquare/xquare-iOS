import ProjectDescription

extension TargetScript {
    public static let removeStaticFrameworksScripts = TargetScript.pre(
        script: """
                LOGFILE="${ARCHIVE_PATH}/static-frameworks.log"
                echo "Removing static frameworks from ${WRAPPER_NAME} archive" > $LOGFILE
                find "${ARCHIVE_PRODUCTS_PATH}/Applications/${WRAPPER_NAME}" -name '*.framework' -print0 | while IFS= read -r -d '' fm; do
                    name=$(basename "${fm}" .framework)
                    target="${fm}/${name}"
                    echo "Checking: ${fm}" >> $LOGFILE
                    if file "${target}" | grep -q "current ar archive"; then
                        rm -rf "${fm}"
                        echo "Removed static framework: ${fm}" >> $LOGFILE
                    fi
                done
                """,
        name: "RemoveStaticFrameworksScripts"
    )
}
