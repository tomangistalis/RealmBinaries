// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.51.0"

#if swift(>=6.0)
    let realm = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/Realm@16.0-beta1.spm.zip"
    let realmChecksum = "0ee9eb86ee5d580fea6c9498b978185611b1f0a7a4d1ed25d3b37f20101f9d20"

    let realmSwift = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@16.0-beta1.spm.zip"
    let realmSwiftChecksum = "f73c67ab8b6a99d87ea048af9dcb38877e6069928fe4f41bec139e2e9e021015"
#else
    let realm = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "bf09d3f3dc7637ed9a5bd24f17024cf654962f9755d50f8bdf42bd95360ab7cb"

    let realmSwift = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "a8622120be243ea2cf9d4aa7e900df34ccd56239d06526ef0413a8b942f20130"
#endif

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
