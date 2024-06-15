// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.51.0"

    let realm = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "52c24b44863f83433592590035ba7cf55478cb076b659a68218e8d98648ef115"

    let realmSwift = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "b39f8b7ed1d432f3bc5c65649997d00676062a9e73e3fcda07d5146744c79736"

    return [
        .binaryTarget(
            name: "Realm",
            url: realm,
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
