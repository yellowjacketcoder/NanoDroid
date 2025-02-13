#!/sbin/sh
##########################################################################################
# 
# NanoDroid Patcher survival script
# by Nanolx
# 
# Inspired by 99-flashafterupdate.sh of osm0sis @ xda-developers
# Forked from 99-magisk.sh of topjohnwu @ xda-developers
# 
##########################################################################################

. /tmp/backuptool.functions

if [ ! -f /data/adb/nanodroid_patcher/CommonPatcher ]; then
	echo " !! failed to load CommonPatcher"
	exit 1
else
	source "/data/adb/nanodroid_patcher/CommonPatcher"
fi

setup_environment
BASEDIR=/data/adb/nanodroid_patcher
PATCH_CORE="${BASEDIR}/core_services.jar.dex"

NanoDroidPatcher () {
	ui_print " "
	ui_print "*******************************"
	ui_print "   NanoDroid Framework Patcher   "
	ui_print "     addon.d 18.0.99999999     "
	ui_print "       created by @Nanolx      "
	ui_print " Utilizing DexPatcher @lanchon "
	ui_print "*******************************"
	ui_print " "

	mount_partitions

	[ -f /data/adb/.nanodroid-patcher ] && \
		rm -f /data/adb/.nanodroid-patcher
	[ -f /data/adb/NanoDroid_Patched ] && \
		rm -f /data/adb/NanoDroid_Patched

	for bin in zip.arm zip.x86 file.arm file.x86 \
		vdexExtractor.arm vdexExtractor.arm64 \
		vdexExtractor.x86 vdexExtractor.x86_64; do 
		chmod 0755 "${BASEDIR}/${bin}" || \
			error " !! failed to prepare environment"
	done

	detect_sdk
	detect_arch
	detect_odex

	[ -f ${MAGISK_IMG} ] && magisk_setup

	patch_services
	install_services

	ui_print " "
	ui_print " >> clean up"

	magisk_cleanup

	ui_print " "
	ui_print " > Done!"
	ui_print " "
	ui_print "Thanks for using NanoDroid"
	ui_print " "

	exit 0
}

##########################################################################################
# Check environment
##########################################################################################

if [[ ! -d /data/adb/nanodroid_patcher ]]; then
	ui_print " "
	ui_print " !! NanoDroid-Patcher environment missing"
	ui_print " !! guessing, you've wiped /data ?"
	ui_print " !! re-flash the NanoDroid-Patcher zip"
	ui_print " "
	exit 0
fi

##########################################################################################
# Stuffz
##########################################################################################

case "${1}" in
	backup)
		# Stub
	;;
	restore)
		# Stub
	;;
	pre-backup)
		# Stub
	;;
	post-backup)
		# Stub
	;;
	pre-restore)
		# Stub
	;;
	post-restore)
		OUTFD=$(ps | grep -v grep | grep -oE "update(.*)" | cut -d" " -f3)
		NanoDroidPatcher
	;;
esac

