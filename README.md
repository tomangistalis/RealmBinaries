# RealmBinaries
Vends Realm xcframeworks via SPM to save build time

How to release a new version :
- Run `./scripts/update.sh 10.38.3`
- Run swift package compute-checksum <path> from this repo folder for each of the 4 zips
- In `Package.swift`:
    - Update `realmVersion` variable value to new Realm version (ex: "10.38.3")
    - Replace checksums
- Push, tag with the same version number as original repo
- Run `gh release create 10.38.3 --draft --title "10.38.3" --notes "Updated to 10.38.3" --repo tomangistalis/RealmBinaries ./*.xcframework.zip` to create the release and upload the frameworks.
