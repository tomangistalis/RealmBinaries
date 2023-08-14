// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.42.0"
let baseURL = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)"

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
    targets: [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm.xcframework.zip",
            checksum: "8f8ca3831d81f7612ffcfbc241748047c79dd69dcf687e095db6e134db80b7cd"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift.xcframework.zip",
            checksum: "31dd97e41c0d7b4fcae05084cce8b3e3f75b5a80f644518f16f559796ee388f8"
        )
    ]
)
