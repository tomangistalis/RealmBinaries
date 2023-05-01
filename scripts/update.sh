#!/bin/bash

# Check if the version parameter was passed
if [ -z "$1" ]; then
    echo "Error: version parameter is missing"
    exit 1
fi

# Get the version parameter from the command line argument
VERSION="$1"
XCODE_VERSION="14.3"

# Download and unzip the realm-swift release
curl -LO "https://github.com/realm/realm-swift/releases/download/v${VERSION}/realm-swift-${VERSION}.zip"
unzip "realm-swift-${VERSION}.zip"

# Zip every .xcframework file inside the 14.3 subfolder
cd "realm-swift-${VERSION}/${XCODE_VERSION}"
for framework in *.xcframework; do
    zip -r "${framework}.zip" "${framework}"
done

# Run swift package compute-checksum for every zipped file and print the result
for zipfile in *.xcframework.zip; do
    checksum=$(swift package compute-checksum "${zipfile}")
    echo "${zipfile}: ${checksum}"
done

for zipfile in *.xcframework.zip; do
    cp $zipfile ../../
done

cd ../..

rm realm-swift-${VERSION}.zip

rm -R realm-swift-${VERSION}

echo "Done."