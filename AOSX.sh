# Update
git pull && ./repo sync -cq -j8

# SU
rm system/extras/su/Android.mk &> /dev/null

# Dhcpd rules needed by Wi-Fi Direct
curl https://raw.githubusercontent.com/CyanogenMod/android_hardware_qcom_wlan/cm-11.0/qcwcn/config/android_dhcpcd.conf > device/sony/montblanc-common/config/dhcpcd.conf

# Missing TI's files in AOSP
curl https://raw.githubusercontent.com/CyanogenMod/android_system_netd/cm-11.0/SoftapControllerTI.cpp > system/netd/SoftapControllerTI.cpp
curl https://raw.githubusercontent.com/CyanogenMod/android_system_netd/cm-11.0/SoftapControllerTI.h > system/netd/SoftapControllerTI.h

# APNs list
curl https://raw.githubusercontent.com/CyanogenMod/android_vendor_cm/cm-11.0/prebuilt/common/etc/apns-conf.xml > device/generic/goldfish/data/etc/apns-conf.xml

#Compile
if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    # Use local Java Development Kit 6
    if (( $(java -version 2>&1 | grep version | cut -f2 -d".") > 6 )); then
       echo "Using local JDK 6..."
       export JAVA_HOME=$(realpath ../jdk1.6.0_45);
    fi
    case $1 in
    -u)
      lunch full_kumquat-eng && make otapackage -j12;
    ;;
    -ru)
      lunch full_kumquat-userdebug && make otapackage -j12;
    ;;
    -p)
      lunch full_nypon-eng && make otapackage -j12;
    ;;
    -rp)
      lunch full_nypon-userdebug && make otapackage -j12;
    ;;
    -s)
      lunch full_pepper-eng && make otapackage -j12;
    ;;
    -rs)
      lunch full_pepper-userdebug && make otapackage -j12;
    ;;
    -g)
      lunch full_lotus-eng && make otapackage -j12;
    ;;
    -rg)
      lunch full_lotus-userdebug && make otapackage -j12;
    ;;
    *)
      echo "ERROR: Unknow option";
      exit -1;
    ;;
    esac
  else 
    echo "ERROR: . build/envsetup.sh falied"
    exit -1;
  fi
else
  echo "ERROR: Number of options not correct. Usage: ./CRUPC.sh -u | -p | -s | -g | -ru | -rp | -rs | -rg"
  exit -1;
fi
