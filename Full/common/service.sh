#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# Create private Log directory
LOGDIR="${MODDIR}"/.logs

[[ ! -d ${LOGDIR} ]] && mkdir -p "${LOGDIR}"

# Set current date in 20170607-12.07.25 format
CURDATE=$(date +%Y%m%d-%I.%M.%S)

# This script will be executed in late_start service mode
# More info in the main Magisk thread
for init in fstrim logscleaner sqlite external_sd permissions; do
	"${MODDIR}/init.d/${init}" | \
		tee -a "${LOGDIR}/${init}.log.${CURDATE}" &
done

# in Magisk Mode microG DroidGuard Helper needs to be installed as user app
sleep 30 && pm list packages -f | grep -q /data.*org.microg.gms.droidguard || \
	pm install -r "${MODDIR}/system/priv-app/DroidGuard/DroidGuard.apk" &

"${MODDIR}/init.d/logcat" &
