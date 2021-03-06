import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        // KeychainSwift
        .remote(url: "https://github.com/evgenyneu/keychain-swift",
                requirement: .upToNextMajor(from: "20.0.0")),
        // Moya
        .remote(url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.0")),
        // Quick
        .remote(url: "https://github.com/Quick/Quick",
                requirement: .upToNextMajor(from: "5.0.0")),
        // RxNimble
        .remote(url: "https://github.com/RxSwiftCommunity/RxNimble",
                requirement: .upToNextMajor(from: "5.1.0")),
        // RxSwift
        .remote(url: "https://github.com/ReactiveX/RxSwift",
                requirement: .upToNextMajor(from: "6.5.0")),
        // SQLite
        .remote(url: "https://github.com/stephencelis/SQLite.swift.git",
                requirement: .upToNextMajor(from: "0.13.3")),
        // SemicolonDesign
        .remote(url: "https://github.com/semicolonDSM/SemicolonDesign_iOS.git",
                requirement: .upToNextMajor(from: "1.5.0"))
    ]),
    platforms: [.iOS]
)
