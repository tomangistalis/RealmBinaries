// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.54.1"

#if swift(>=6.0.3)
    let realm = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "5be6d10b5829dd7f20bd4e4cf8dab29f3985ca815de3105c9e1866aa82eda431"

    // https://github.com/realm/realm-swift/releases/download/v10.54.1/RealmSwift@16.1.spm.zip
    // https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@16.1.spm.zip
    let realmSwift = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@16.2.spm.zip"
    let realmSwiftChecksum = "1717a538551f4d0790dd2091301aa1fba762b5c766f7d8975a0ee34ca72f1310"
#elseif swift(>=6.0.2)
    let realm = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "5be6d10b5829dd7f20bd4e4cf8dab29f3985ca815de3105c9e1866aa82eda431"

    let realmSwift = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/RealmSwift@16.1.spm.zip"
    let realmSwiftChecksum = "e9089f8080f6fd82f74cc155987921e1ce8f7f2b79622482f7a3533e4686912d"
#else
    let realm = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "5be6d10b5829dd7f20bd4e4cf8dab29f3985ca815de3105c9e1866aa82eda431"

    let realmSwift = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)/RealmSwift@16.0.spm.zip"
    let realmSwiftChecksum = "e1b61a224535c7220398ff6a043cdb831d604f29568303b248a8b514f9187981"
#endif

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
        //     path: "Realm@16.1.spm.zip"
        // ),
        // .binaryTarget(
        //     name: "RealmSwift",
        //     path: "RealmSwift@16.1.spm.zip"
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
