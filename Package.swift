// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.39.1"
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
            checksum: "248e38c7e270e405f505059032ee687bb4b1acb0cf8f502077b80fec327d9d94"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift.xcframework.zip",
            checksum: "bd299e4c213137bbda5ddc40bb646fc8c643ee189c8fd2bb154971a10ba48f3c"
        )
    ]
)
