#!/usr/bin/env bash
#Place this script in project/android/app/

cd ..

# fail if any command fails
set -e
# debug log
set -x

cd ..
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_2.0.2-stable.zip
unzip -q flutter_macos_2.0.2-stable.zip
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

# build APK
# if you get "Execution failed for task ':app:lintVitalRelease'." error, uncomment next two lines
# flutter build apk --debug
# flutter build apk --profile
flutter build apk --flavor appCenter --release 

# if you need build bundle (AAB) in addition to your APK, uncomment line below and last line of this script.
#flutter build appbundle --release --build-number $APPCENTER_BUILD_ID

# copy the APK where AppCenter will find it
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/flutter-apk/app-appcenter-release.apk  $_

# copy the AAB where AppCenter will find it
#mkdir -p android/app/build/outputs/bundle/; mv build/app/outputs/bundle/release/app-release.aab $_
