import ProjectDescription

extension TargetDependency {

    // ABCDEFGHIJKLMNOPQRSTUVWXYZ
    public struct SPM {
        public static let KeychainSwift = TargetDependency.external(name: "KeychainSwift")

        public static let Moya = TargetDependency.external(name: "Moya")

        public static let Realm = TargetDependency.external(name: "RealmSwift")
        public static let RxSwift = TargetDependency.external(name: "RxSwift")
        public static let RxTest = TargetDependency.external(name: "RxTest")
    }

    /// 모든 패키지가 공통적으로 사용하는 외부 라이브러리 들.
    public static let universalDependencies: [TargetDependency]  = [
        .SPM.RxSwift
    ]

}
