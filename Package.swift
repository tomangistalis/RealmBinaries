// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.40.2"
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
            checksum: "1b76a73e6566b68328ab62fdff0d1207011ef8521a07756711710ee8fbac5b4d"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift.xcframework.zip",
            checksum: "04a6d1b69a38edf8c0b5f0795327ac49619a33db9ea6d4d6e6a8aa19f8470bd4"
        )
    ]
)
