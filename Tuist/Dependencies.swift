import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        // KeychainSwift
        .remote(url: "https://github.com/evgenyneu/keychain-swift",
                requirement: .upToNextMajor(from: "20.0.0")),
        // Moya
        .remote(url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.0")),
        // Nimble
        .remote(url: "https://github.com/Quick/Nimble",
                requirement: .upToNextMajor(from: "10.0.0")),
        // Quick
        .remote(url: "https://github.com/Quick/Quick",
                requirement: .upToNextMajor(from: "5.0.0")),
        // RealmSwift
        .remote(url: "https://github.com/realm/realm-swift",
                requirement: .upToNextMajor(from: "10.25.0")),
        // RxSwift
        .remote(url: "https://github.com/ReactiveX/RxSwift",
                requirement: .upToNextMajor(from: "6.5.0")),
        //Swinject
        .remote(url: "https://github.com/Swinject/Swinject",
                requirement: .upToNextMajor(from: "2.8.0"))
    ]),
    platforms: [.iOS]
)
