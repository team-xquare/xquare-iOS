import ProjectDescription

extension TargetDependency {

    // ABCDEFGHIJKLMNOPQRSTUVWXYZ
    public struct SPM {

        public static let Boutique = TargetDependency.external(name: "Boutique")

        public static let FirebaseMessaging = TargetDependency.external(name: "FirebaseMessaging")

        public static let KeychainSwift = TargetDependency.external(name: "KeychainSwift")

        public static let Moya = TargetDependency.external(name: "Moya")

        public static let Nimble = TargetDependency.external(name: "Nimble")

        public static let Quick = TargetDependency.external(name: "Quick")

        public static let RxBlocking = TargetDependency.external(name: "RxBlocking")
        public static let RxCocoa = TargetDependency.external(name: "RxCocoa")
        public static let RxMoya = TargetDependency.external(name: "RxMoya")
        public static let RxNimble = TargetDependency.external(name: "RxNimble")
        public static let RxSwift = TargetDependency.external(name: "RxSwift")

        public static let SemicolonDesign = TargetDependency.external(name: "SemicolonDesign")
        public static let XWebKit = TargetDependency.external(name: "XWebKit")

    }

    /// 모든 패키지가 공통적으로 사용하는 외부 라이브러리 들.
    public static let universalDependencies: [TargetDependency]  = [
        .SPM.RxSwift
    ]

}
