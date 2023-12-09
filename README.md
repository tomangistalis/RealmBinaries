# RealmBinaries
Vends Realm xcframeworks via SPM to save build time

Origin: https://github.com/realm/realm-swift/releases

How to release a new version :
- Run `./scripts/update.sh 10.38.3`
- Run `swift package compute-checksum <path>` from this repo folder for each of the 4 zips
- In `Package.swift`:
    - Update `realmVersion` variable value to new Realm version (ex: "10.38.3")
    - Replace checksums
- Push, tag with the same version number as original repo
- Run `VERSION=v10.44.0 gh release create $VERSION --draft --title "$VERSION" --notes "Updated to $VERSION" --repo tomangistalis/RealmBinaries ./*.xcframework.zip` to create the release and upload the frameworks.
