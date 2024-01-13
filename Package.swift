// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.45.3"
    let baseURL = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)"

    let realmChecksum = "db7ed7e71a7d2b17ebb504cf05de1e31b5d7c9a4eee9e908fc88080564f56c25"

    let realmSwift = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/RealmSwift@15.2.spm.zip"
    let realmSwiftChecksum = "4baa92fbe999a0240b11bab3246fe16112faa4e42cfe2d9583258ec364ec1340"

    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm.spm.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: realmSwift,
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmBinaries",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v11),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)
