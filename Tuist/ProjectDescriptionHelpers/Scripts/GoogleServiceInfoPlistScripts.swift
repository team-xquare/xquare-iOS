import ProjectDescription

extension TargetScript {
    public static let googleInfoPlistScripts = TargetScript.pre(
        script: """
                case "${CONFIGURATION}" in
                    "DEV" )
                        cp -r "$SRCROOT/Resources/Firebase/GoogleService-Dev-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
                    "STAGE" )
                        cp -r "$SRCROOT/Resources/Firebase/GoogleService-Stage-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
                    "PROD" )
                        cp -r "$SRCROOT/Resources/Firebase/GoogleService-Prod-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
                    *)
                    ;;
                esac
                """,
        name: "GoogleService-Info.plist",
        basedOnDependencyAnalysis: false
    )
}
