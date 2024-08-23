// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.53.0"

    let realm = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/Realm@16.0-beta6.spm.zip"
    let realmChecksum = "f5e3a0a5af2596cbc4b65f0e0c20b94d528051058e9543d43aa0c4d1350a277d"

    let realmSwift = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@16.0-beta6.spm.zip"
    let realmSwiftChecksum = "5aefcf1a029a938b769377edf0de41b714f7b1e4fbf87e65cceffd1a8e8bab26"

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
        //     path: "Realm@16.0-beta6.spm.zip"
        // ),
        // .binaryTarget(
        //     name: "RealmSwift",
        //     path: "RealmSwift@16.0-beta6.spm.zip"
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
