#!/bin/bash

set -ev
set -o pipefail

IOS_SIMULATOR_ID=`xcrun instruments -s devices 2>/dev/null | sed -n -E 's/^iPhone 8 \(11\.3\)[^+]*\[([[:xdigit:]-]{36})\].*\(Simulator\)$/\1/p' | sed -n -e 1p`

if [ "${TRAVIS_XCODE_PROJECT-UNDEF}" != "UNDEF" ]; then
    xcodebuild -project ${TRAVIS_XCODE_PROJECT} -scheme ${TRAVIS_XCODE_SCHEME} -destination "id=${IOS_SIMULATOR_ID}" -sdk ${TRAVIS_XCODE_SDK} test
else
    xcodebuild -workspace ${TRAVIS_XCODE_WORKSPACE} -scheme ${TRAVIS_XCODE_SCHEME} -destination "id=${IOS_SIMULATOR_ID}" -sdk ${TRAVIS_XCODE_SDK} test
fi
