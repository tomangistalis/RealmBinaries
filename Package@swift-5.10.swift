// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.53.0"

    let realm = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "632a17f1ca302b777572a20c158f3c52ad76e343cd228887ec7a6a6fba18e9cc"

    // let realmSwift = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/RealmSwift@15.4.spm.zip"
    // let realmSwiftChecksum = "0897ce8ceb4f983d6d07ab9b00eb59ab2bc855e2d54018c919d1e92db304f3f1"

    // Use Xcode 15.3 due to a Firebase bug
    let realmSwift = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "df36bb69810ae58b54cbd1e704b125238093d4dc5440991c9bb31cad8a5cfedd"

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
