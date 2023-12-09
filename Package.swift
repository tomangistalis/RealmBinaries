// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//https://github.com/realm/realm-swift/releases/download/v10.42.1/RealmSwift@15.0.spm.zip

func buildTargets() -> [Target] {
    let realmVersion = "v10.44.0"
    let baseURL = "https://github.com/realm/realm-swift/releases/download/\(realmVersion)"

    let realmChecksum = "b26c979ce122acaabb6a6eef9567de43344377afa825c597ae6e14caf508c225"

    #if swift(>=5.9.2)
        let url = "https://github.com/tomangistalis/RealmBinaries/releases/download/\(realmVersion)/RealmSwift@15.1.spm.zip"
        let realmSwiftChecksum = "2a602176b71055b49576aa7e565ad8317873b496336a5acf0a26f2bcd4906212"
    #elseif swift(>=5.9)
        let url = "\(baseURL)/RealmSwift@15.0.spm.zip"
        let realmSwiftChecksum = "c548dd125df800b5888129f93119360cd3bb3b74ebd740bc21a170f411debee1"
    #else
        let url = "\(baseURL)/RealmSwift@14.3.1.spm.zip"
        let realmSwiftChecksum = "288a311f83ec1d1dc051084f1aeee51ecb165407ef95f5081c9b20df0b952671"
    #endif

    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm.spm.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: url,
            checksum: realmSwiftChecksum
        )
    ]
}

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
    targets: buildTargets()
)
