# NanoDroid

Versions until 15.1 were called **NanoMod**, starting with 16.0 they're called **NanoDroid**.

## Current Release

* Stable: 17.9.20180818
* Beta: 18.0~beta2 (20180901)

## Downloads

### Primary Mirror

On AndroidFileHost **all** stable and beta releases are available.

* Stable Downloads [> Androidfilehost](https://androidfilehost.com/?w=files&flid=198483)
* Beta Downloads [> Androidfilehost](https://androidfilehost.com/?w=files&flid=183250)

### Secondary Mirror

On Nanolx the latest stable and beta releases are available, no previous releases.

* Stable Downloads [> Nanolx](https://androidfilehost.com/?w=files&flid=198483)
* Beta Downloads [> Nanolx](https://androidfilehost.com/?w=files&flid=183250)

### Snapshots

You can create snapshots from this repository.

* on GNU/Linux, MacOS or *BSD clone this repository and use the provided `build-package` script like
  * first step:
     * `build-package pull` to download all required apks for Full, microG and F-Droid package
  * second step:
     * `build-package full` to create the full package
     * `build-package microg` to create the microG only package
     * `build-package fdroid` to create the F-Droid only package
     * `build-package patcher` to create the on-device framework-patcher package
     * `build-package uninstaller` to create the uninstaller package
     * `build-package setupwizard` to create the Setup Wizard package
     * `build-package all` to create all packages at once
  * third step:
     * `build-package u-microg` to update microG
     * `build-package u-fdroid` to update F-Droid
     * `build-package u-apps` to update (most) applications
     * `build-package u-swipe` to update swipe libraries
     * `build-package u-gsync` to update Google Sync Adapters
     * `build-package pull` to update/re-download everything

for apks downloaded from F-Droid or microG repository or from APK Mirror, `build-package` checks the SHA256 hash.

The `build-package` script additionally supports the following parameters:

* `check` check if all files were properly downloaded
* `clean` remove any untracked files from the repo (e. g. from `build-package pull`)
* `dalvik [.jar]` prepare a jar file for use with DalvikVM
* `ver [version] [date]` change project version
* `bump` increment Magisk module version by 1

The following applications are custom builds:

* Play Store (reason: re-signed and modified to support (in-)app-purchases with microG GmsCore)
  * [Download Link](https://www.nanolx.org/apk/Phonesky.apk)
* Fake Store (reason: built with CHECK_LICENSE permission)
  * [Download Link](https://www.nanolx.org/apk/FakeStore.apk)
* microG GmsCore (reason: built with more recent spoofed Play Services Version, more)
  * [Download Link](https://www.nanolx.org/apk/GmsCore.apk)
* microG DroidGuard Helper (reason: built with fix for non 32bit arm devices failing SafetyNet attestation)
  * [Download Link](https://www.nanolx.org/apk/DroidGuard.apk)
* MPV (reason: infrequent updates, merge-requests included)
  * [Download Link](https://www.nanolx.org/apk/MPV.apk)

Also `build-package` looks if the configuration files

* `.nanodroid-setup`
* `.nanodroid-apps`
* `.nanodroid-overlay`

exist in the `data` directory of the repository, if so, those files are used when creating packages instead of the default ones from the `doc` directory.

See the documentation below for more information on those files and what they do.

## Supported Android Versions

NanoDroid officially supports the following Android versions:

* 4.4 / SDK 19 (KitKat)
  * System Mode only (Magisk does not support KitKat)
* 5.0 / SDK 21 (Lollipop)
* 5.1 / SDK 22 (Lollipop)
* 6.0 / SDK 23 (Marshmallow)
* 7.0 / SDK 24 (Nougat)
* 7.1 / SDK 25 (Nougat)
* 8.0 / SDK 26 (Oreo)
* 8.1 / SDK 27 (Oreo)
* 9.0 / SDK 28 (Pie)
  * Patchers works
     * if your ROM's services.jar already contains classes.dex
     * and you use baksmali/smali on PC to convert from ODEX 039 format to an older
     * [> Deodex Instructions](doc/DeodexServices.md)

earlier versions will never officially be supported (you may still report bugs, though).

Future versions will be officially supported, eventually.

## Support

[> XDA](https://forum.xda-developers.com/apps/magisk/module-nanodroid-5-0-20170405-microg-t3584928) Support Thread

## ChangeLog

Full, user-readible [> ChangeLog](ChangeLog.md)

## Summary

**NanoDroid** can be installed as a Magisk Module or directly to /system, most functionality is available, in System Mode, too.

More information about Magisk [> XDA](https://forum.xda-developers.com/apps/magisk)

NanoDroid includes

* microG and it's companions
  * on-device framework-patcher for microG support (signature spoofing)
  * on-pc framework-patcher for microG support (signature spoofing)
  * GApps are auto-removed during installation
     * using [> NanoDroid-Overlay](doc/NanoDroidOverlay.md)
     * the Uninstaller will restore them in System Mode (or re-flash the ROM)
     * see the [> GApps Removal List](doc/GAppsRemoval.md)
  * location packages conflicting with unified Nlp will are auto-removed during installation
     * using [> NanoDroid-Overlay](doc/NanoDroidOverlay.md)
     * the Uninstaller will restore them (or re-flash the ROM)
     * see the [> GApps Removal List](doc/GAppsRemoval.md)
* F-Droid and it's privileged extension
* modified Play Store to allow (in-)app-purchases with microG
  * this required the Play Store to be modified, see the [> patch](doc/Phonesky.diff)
  * alternatively Yalp Store can be installed instead
* custom init scripts
* pseudo-debloat feature (Magisk-only)
  * disables applications systemless-ly
  * pre-configured [> default settings](doc/NanoDroidOverlay.md)
* several Open Source applications
  * include replacements for the pseudo-debloated applications
  * full list of [> included applications](doc/Applications.md)
* additional components
  * GNU Bash shell
  * GNU Nano terminal editor
  * several utilities from `util-linux`, `bsdmainutils` and more
  * Addon.d support for System Mode installation
     * restores NanoDroid after ROM update
     * re-debloates GApps, if required
     * restored NanoDroid-Font setup, if required
* The Legend of Zelda ringtones and sounds
* System UI fonts from several Nintendo games

## Packages

### Modules

Module packages, flashing through TWRP recommended, though flashing through Magisk Manager works aswell.

* **NanoDroid**: includes
  * everything mentioned in the Summary
* **NanoDroid-microG**: includes (only)
  * microG and it's companions
  * pseudo-debloat feature
  * app store(s)
  * GApps and location packages auto-removal
* **NanoDroid-fdroid**: includes (only)
  * F-Droid and it's privileged extension

#### Installation Logfiles

The recovery log and installation configuration is stored after installation, regardless with it succeeded or failed.

You'll find the files in

* /data/adb/MODID_log_INSTALLDATE
* /data/adb/MODID_twrp_INSTALLDATE

where MODID is either NanoDroid, NanoDroid_microG or NanoDroid_FDroid. INSTALLDATE is the date of installation in %Y%m%D_%H.%M.%S format (eg: 20180709_20.34.14), **Note: when installing through Magisk Manager INSTALLDATE might be in UTC +0000, instead of your local time offset!**

In case of installation errors, issues or questions provide theese files in your report for easier debugging.

#### Parallel Installations

Since the microG and F-Droid packages are subsets of the Full NanoDroid package, they can't be installed alongside.

The microG and F-Droid packages however can be installed in parallel, as they complement each other.

### Extras

Extra packages, always flash through TWRP.

* **NanoDroid-patcher**: includes
  * on-device framework-patcher for signature spoofing support
     * requires an deodexed ROM
         * [> Deodex Instructions](doc/DeodexServices.md)
  * creates the file `/data/adb/NanoDroid_Patched` after successful patching
  * installs an addon.d script for automatic re-patching after ROM update
     * addon.d support files reside in `/data/adb/nanodroid-patcher/`
* **NanoDroid-setupwizard**: includes
  * **AROMA** based Setup Wizard to create the configuration files
  * user can choose where to store the configuration files
     * `/sdcard` (fallback)
     * `/external_sd`
     * `/data`
  * **NOTE:** AROMA only works on `arm` and `arm64`, if your device is `x86` or `x86_64`, it won't work
* **NanoDroid-uninstaller**: includes
  * uninstalls *all* NanoDroid Magisk Modules
     * also old NanoMod Magisk Modules
  * uninstalls NanoDroid installed in System Mode
  * uninstalls NanoDroid configuration files
  * uninstalls NanoDroid-Patcher addon.d environment
  * restores GApps and location services auto-removed during installation (System Mode)
  * restores `services.jar` patched by NanoDroid-Patcher (System Mode)

### Scripts

Misc. Script for use from PC/Notebook, while device is in TWRP, they are found in this repository

* **framework-patcher**
  * on-device framework-patcher for signature spoofing support
     * requires an deodexed ROM
         * [> Deodex Instructions](doc/DeodexServices.md)
  * creates the file `/data/adb/NanoDroid_Patched` after successful patching
  * invoke like `framework-patcher [ver]`
     * where [ver] is your Android version (6.0, 7.1, ...)
  * the original, unpatched `services.jar` is backed up to `/sdcard/nanodroid_backups`
* **force-debloat**
  * system debloater
  * the list of applications resides in the script itself
  * needs to be run from TWRP, requires explicit user acceptance
  * supports `.nanodroid-overlay` configuration file
     * uses fallback values, if none found
         * which are in the script itself and can be edited
  * has a test mode which prints what would be done
* **mount-magisk**
  * script to mount or unmount Magisk in TWRP
  * script toggles mount-state (read: will mount Magisk if unmounted and unmount Magisk if mounted)

## Details

### NanoDroid

This lists features unique to NanoDroid.

#### NanoDroid-Overlay

The `nanodroid-overlay` script handles the debloat feature

  * pseudo-debloat applications in Magisk Mode
  * force-debloat applications in System Mode
  * show the list of debloated apps
  * show the lits of non-debloated apps
  * add or remove apps from the list of debloated apps

  * Full details on the NanoDroid-Overlay Script [> Details](doc/NanoDroidOverlay.md)

#### NanoDroid-Prop

The `nanodroid-prop` script utilizes Magisk's resetprop to alter system properties

  * add system properties (Magisk-only)
     * both on-the-fly and permanently
  * properties set by this script survive NanoDroid updates

Full details on the NanoDroid-Prop Script [> Details](doc/NanoDroidProp.md)

#### NanoDroid-Perm

The `nanodroid-perm` script grants microG and Co. required permissions, if lacking

Full details on the NanoDroid-Perm Script [> Details](doc/NanoDroidPerm.md)

#### NanoDroid-UPD

The `nanodroid-upd` script allows to update NanoDroid's custom apks

  * Play Store
  * Fake Store
  * MPV

which can't be updated through Play/Yalp Store or F-Droid otherwise

Full details on the NanoDroid-UPD Script [> Details](doc/NanoDroidUPD.md)

#### NanoDroid-Util

The `nanodroid-util` script contains the following features

  * show boot count
  * fix OTA update issues (like non-working navbar)
  * handle Audio Focus permission
     * prevent apps from stealing audio output, for example listen to Music while playing Pokémon Go
  * handle Read Clipboard permission
  * modify Airplane Mode settings
     * choose which radios are on or off in Airplane mode

Full details on the NanoDroid-Util Script [> Details](doc/NanoDroidUtil.md)

#### NanoDroid-Font

The `nanodroid-font` script changes the Sytem UI font

Full details on the NanoDroid-Font Script [> Details](doc/NanoDroidFont.md)

#### init scripts

The following init scripts are bundled with NanoDroid

* external_sd
  * symlink SD Card mount point to `/external_sd`
  * SD Card needs to be inserted upon boot
* fstrim
  * trim file systems (may increase speed)
* logcat
  * store logcat in /data/adb
     * logs older than 7 days are deleted on every reboot
* logscleaner
  * clean up log files
* sqlite
  * clean up sqlite databases

When in Magisk Mode the init scripts create their log files in

  `/magisk/NanoDroid/.logs/${script}.log.${date}`

When installed to /system your ROM needs to support running scripts in

  `/system/etc/init.d`

or you can use **Kernel Adiutor's** init.d emulation.

#### Shell Utilities

Several utilities from `bsdmainutils` and `util-linux`

* [> bsdmainutils Launchpad](https://launchpad.net/ubuntu/+source/bsdmainutils)
* [> util-linux GitHub](https://github.com/karelzak/util-linux)

are included:

* col
* colcrt
* colrm
* column
* findfs
* findmnt
* hexdump
* look
* lsblk
* lscpu
* lsipc
* lslocks
* lsns
* ncal
* setterm
* whereis

Other shell utilities

* less [> Website](http://www.greenwoodsoftware.com/less/)
  * lessecho
  * lesskey
* unzip [> Website](http://www.info-zip.org/UnZip.html)

#### GNU Bash and GNU Nano

NanoDroid includes GNU Bash shell and the GNU Nano terminal editor.

* [> GNU Bash Website](https://www.gnu.org/software/bash/bash.html)
* [> GNU Nano Website](https://www.nano-editor.org/)

### microG

microG is an Open Source replacement for Google Services, full details can be found at the microG homepage [> Website](http://microg.org/)

NanoDroid includes microG as follows

* microG GmsCore [> GitHub](https://github.com/microg/android_packages_apps_GmsCore)
* with **Déjà Vu** location provider backend [> F-Droid](https://f-droid.org/de/packages/org.fitchfamily.android.dejavu/)
* with **Mozilla** location provider backend [> F-Droid](https://f-droid.org/repository/browse/?fdfilter=mozilla&fdid=org.microg.nlp.backend.ichnaea)
* with **Nominatim** adress provider backend [> F-Droid](https://f-droid.org/repository/browse/?fdfilter=nominatim&fdid=org.microg.nlp.backend.nominatim)
* with **microG** GsfProxy [> GitHub](https://github.com/microg/android_packages_apps_GsfProxy)
* with **microG** DroidGuard Helper [> GitHub](https://github.com/microg/android_packages_apps_RemoteDroidGuard)
  * required for SafetyNet support
* support for Maps API version 1
* support for Google Calendar and Contacts Sync Adapter
  * disabled by default
* optional Swipe libraries
  * disabled by default
* choose between official **Play Store** [> APK Mirror](https://www.apkmirror.com/apk/google-inc/google-play-store/) or unofficial **Yalp Store** [> F-Droid](https://f-droid.org/repository/browse/?fdfilter=yalp&fdid=com.github.yeriomin.yalpstore)
  * **Yalp Store** can use system permissions to install packages, so you don't need to enable `Unknown Sources`
     * go to **Yalp Store** > Settings > Installation Method > `Using system permissions`
  * Play Store is modified to allow (in-)app-purchases with microG
* GApps and several location services conflict with microG and unified Nlp. Thus they are removed during NanoDroid installation
  * using [> NanoDroid-Overlay](doc/NanoDroidOverlay.md)
  * see [> GAppsRemoval](doc/GAppsRemoval.md) for more details

### F-Droid and Applications

F-Droid [> Website](http://www.fdroid.org) is an app store for Open Source applications.

NanoDroid includes both F-Droid and it's Privileged Extension [> F-Droid](https://f-droid.org/repository/browse/?fdfilter=f-droid&fdid=org.fdroid.fdroid.privileged), so you don't need to enable `Unknown Sources`.

Additionally NanoDroid includes a variety of applications, check full details [> GitHub](doc/Applications.md)

### The Legend of Zelda ringtones and sounds

NanoDroid includes **The Legend of Zelda** [> Nintendo](http://www.zelda.com/) ringtones and sounds, because it's dangerous to root alone.

Full [> Details](doc/ZeldaSounds.md)

### Nintendo Fonts

NanoDroid includes Nintendo Fonts.

Full [> Details](doc/NanoDroidFont.md)

## Installation

### Alter Installation

NanoDroid supports altering the installation settings to a wide degree.

Full [> Details](doc/AlterInstallation.md) on altering installation manually, or use the Setup Wizard (if you've got an arm/arm64 device).

### Installation Process

#### NanoDroid

* Use Setup Wizard to create configuration files (if you've got an arm/arm64 device), or create manually (see above)
* Download pre-built zip or create one from this repository

##### Installing from scratch

This is the recommended way.

* perform full wipe (/system, /data, /cache, Dalvik/ART cache)
  * recommended, but not required
* install desired ROM
  * make sure it does **not** include GApps if you want to use microG
         * NanoDroid tries to get rid of GApps on it's own, but it may not always work, try without any warranty
  * either pre-patched with signature spoofing support or **deoxeded** so you can patch yourself (instructions follow)
* install **Magisk**
  * recommended, but not required
  * if **Magisk** is installed, NanoDroid will be installed as Magisk-Module, else it will install into `/system` directly
* install desired Kernel (if any)
* install **NanoDroid**
* reboot into ROM

###### Upgrade / Installing on a clean ROM

When upgrading NanoDroid or installing on a known clean ROM (read: GApps free), you may also just

* install **Magisk**
  * recommended, but not required
  * if **Magisk** is installed, NanoDroid will be installed as Magisk-Module, else it will install into `/system` directly
* install **NanoDroid**
  * from either Magisk Manager or TWRP, doesn't matter
* reboot

#### microG

##### Signature Spoofing Support

For **microG** to work, your ROM needs to have signature spoofing enabled (or a **deodexed** ROM to patch yourself).

If your ROM does **not** have signature spoofing support, you can manually patch it either
  * flashing the on-device Patcher zip
     * it also installs an addon.d script that auto re-patches the ROM upon update
  * running the `framework-patcher` script
     * use from your PC or laptop while your device is in TWRP. This shell script for GNU Bash (and compatible shells) works on unixoid operating systems like GNU/Linux, BSD or MacOS. It automizes the process of downloading Haystack [> GitHub](https://github.com/Lanchon/haystack), pulling files from phone, patching and installing the modified `services.jar` on the device.

If you ROM is **odexed** read [here](https://gitlab.com/Nanolx/NanoDroid/issues/9#note_96779340) on how to deodex services.jar manually

Both patchers support installing the patched `services.jar` into the following locations:
  * NanoDroid Magisk Module
  * NanoDroid-microG Magisk Module
  * directly into `/system`

So you can use them regardless whether you're using NanoDroid or not.

##### microG Setup

Once your ROM supports signature spoofing, you need to setup microG like this
  * go into **microG settings** and set up everything like:
     * check results in **Self-Check**, grant missing permissions (by tapping on them)
         * especially the **Battery Optimization** item
     * enable **Google device registration**
     * enable **Google Cloud Messaging** (only if you want to receive push messages from your applications)
     * enable **Google SafetyNet** (required for applications that utilize SafetyNet, for example Pokémon GO, ...)
         * '...' menu > set to use the **Official Server**
     * in **UnifiedNlp Settings** choose
         * **Déjà Vu** and/or **Mozilla** as Geolocation backend
         * **Nominatim** as Address lockup backend
     * after everything is done, reboot
     * go to **Play Store**, setup account and install your apps

## License & Credits

My own work (NanoDroid itself) is licensed under the GNU General Public License version 3 or newer [> GNU](https://www.gnu.org/licenses/gpl-3.0.txt)

For more details (including authors and license) on every provided application or Software press the link next to it.

Additional credits go to

* Mar-V-In for microG
  * https://github.com/microg
* topjohnwu for Magisk
  * https://github.com/topjohnwu/Magisk
* Lanchon for dexpatcher and haystack
  * https://github.com/dexpatcher
* osm0sis for GNU Nano and Busybox
  * https://forum.xda-developers.com/showthread.php?t=2239421
* shadow53 for automatic apk grabbing base code
  * https://shadow53.com/android/no-gapps/
* ale5000 for microG system permission files and GApps Removal list
  * https://github.com/micro5k
* PaperYoshi for Nintendo Fonts
  * http://downloads.paperyoshi.at/
* anestisb for vdexExtractor
  * https://github.com/anestisb/vdexExtractor
* JesusFreke for smali/baksmali
  * https://github.com/JesusFreke/smali

Special Thanks to the beta testers

* xenithorb
* ShapeShifter499

## Issues

List of known issues

* SafetyNet check fails with `Google Play Services not available`
  * you did not setup microG (or did not reboot afterwards)
* Battery Drain
  * microG fails to register applications  to GCM (Google Cloud Messaging) if they were installed **before** microG, but the apps keep trying to register and that causes the battery drain, all apps installed **after** microG are properly registered, to fix the battery drain either
     * do a clean flash of your ROM (, Magisk) and NanoDroid and install your apps after microG setup
     * uninstall and re-install all your applications (backup application data if required)
* microG lacks features
  * if you use AppOps, PrivacyGuard or the like you have to grant microG GmsCore **all** permissions, if you prevent some permissions, some apps or features might not work as expected or not at all. Note: some APIs/features are stubs in microG GmsCore, meaning they exist that apps don't complain, but they do nothing - thus blocking microG GmsCore is pretty much of no benefit.

Additional helpful information in the microG [> Wiki](https://github.com/microg/android_packages_apps_GmsCore/wiki/Helpful-Information).

## TODO

* better error handling in **on-pc** framework-patcher
* on-device de-odexing of `services.jar` in NanoDroid-Patcher

## FAQ

```
Q: will there be a GApps version, instead of microG?
A: no. but you can choose not to populate microG.

Q: what devices is this tested on?
A: One Plus 3T, Nexus 6, Moto G (3rd Gen)

Q: what ROMs was this tested on?
A: OmniROM, AOSP Extended; should work on any LineageOS / AOSP based ROM that is working with Magisk.
```
