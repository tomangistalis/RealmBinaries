// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.38.3"
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
            checksum: "270742bada4abe8babb51ba50665cd71f0f7df442bfacf930e389796f97c162c"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift.xcframework.zip",
            checksum: "6ee876dc46f371c42727dfe978f3b1e184030cbdbef4e5e0c6cf8e945b2d6598"
        )
    ]
)
