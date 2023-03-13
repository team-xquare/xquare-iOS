import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        // Boutique
        .remote(url: "https://github.com/mergesort/Boutique.git",
                requirement: .upToNextMajor(from: "2.1.1")),
        // Firebase-iOS-SDK
        .remote(url: "https://github.com/firebase/firebase-ios-sdk",
                requirement: .upToNextMajor(from: "9.5.0")),
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
        // SemicolonDesign
        .remote(url: "https://github.com/semicolonDSM/SemicolonDesign_iOS.git",
                requirement: .upToNextMajor(from: "1.12.0")),
        // XWebKit
        .remote(url: "https://github.com/team-xquare/XWebKit",
                requirement: .upToNextMajor(from: "1.1.5"))
    ],
    baseSettings: Settings.settings(
        configurations: [
            .debug(name: "DEV"),
            .release(name: "STAGE"),
            .release(name: "PROD"),
        ]
    )),
    platforms: [.iOS]
)
