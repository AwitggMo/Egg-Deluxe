#!/usr/bin/env bash
# Builds a debug APK (installable on any Android phone with "install unknown apps" enabled).
# Needs: Node 18+, JDK 17, Android SDK (ANDROID_HOME set) - or just use the GitHub workflow.
set -euo pipefail
npm install
[ -d android ] || npx cap add android
npx capacitor-assets generate --android          # logo + splash from ./assets
M=android/app/src/main/AndroidManifest.xml
grep -q sensorLandscape "$M" || sed -i '0,/<activity/s//<activity android:screenOrientation="sensorLandscape"/' "$M"
npx cap sync android
(cd android && ./gradlew assembleDebug)
mkdir -p dist && cp android/app/build/outputs/apk/debug/app-debug.apk dist/EggOpenerDeluxe.apk
echo "APK ready: dist/EggOpenerDeluxe.apk"
