// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v20.0.0"

    let realm = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/Realm@16.0.spm.zip"
    let realmChecksum = "294b34c0e183750ebb3496cc53f6710a5ef3a2da7b2fe6b229adf5883bacb237"

    let realmSwift = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@16.0.spm.zip"
    let realmSwiftChecksum = "091f62f525521ef04c8551affcbc14c451b1cdc2e3acf6d2707c1280303ce739"

    return [
        // Remote
       .binaryTarget(
           name: "Realm",
           url: realm,
           checksum: realmChecksum
       ),
       .binaryTarget(
           name: "RealmSwift",
           url: realmSwift,
           checksum: realmSwiftChecksum
       ),
        // Local
        // .binaryTarget(
        //     name: "Realm",
        //     path: "Realm@16.0.spm.zip"
        // ),
        // .binaryTarget(
        //     name: "RealmSwift",
        //     path: "RealmSwift@16.0.spm.zip"
        // )
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
