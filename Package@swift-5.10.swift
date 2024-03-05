// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.47.0"
    let baseURL = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)"

    let realmChecksum = "bf09d3f3dc7637ed9a5bd24f17024cf654962f9755d50f8bdf42bd95360ab7cb"

    let realmSwift = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "a8622120be243ea2cf9d4aa7e900df34ccd56239d06526ef0413a8b942f20130"

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
        .macOS(.v10_13),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v4),
        .visionOS(.v1)
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
