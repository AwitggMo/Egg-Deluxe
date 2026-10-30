# Egg Opener Deluxe - Android (landscape)

Everything needed for the APK is here: the game (`www/index.html`), the pixel-art logo and
splash (`assets/`), and a build script. The APK itself has to be compiled with the Android SDK.

## Easiest: build in the cloud (no installs)
1. Create a free GitHub repo and upload this whole folder (keep the `.github` folder).
2. Open the **Actions** tab, run **Build APK** (it also runs on every push).
3. Download **EggOpenerDeluxe-apk** from the finished run, unzip, copy the `.apk` to your phone and open it
   (allow "install unknown apps" when asked).

## Or build locally
Install Node 18+, JDK 17 and Android Studio (for the SDK), then:

    npm install && bash build-apk.sh        # output: dist/EggOpenerDeluxe.apk

## Notes
- The app is locked to landscape (`sensorLandscape`) and the game also shows a "rotate" hint in portrait.
- This is a debug-signed APK, fine for personal installs. For Google Play, build a signed
  release bundle in Android Studio (`android/` folder appears after the first build).
- Progress saves in the app's local storage; use Settings > Export save to back it up.
