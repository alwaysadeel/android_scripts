#Compile
if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    case $1 in
    -u)
      lunch full_kumquat-eng && make otapackage -j8;
    ;;
    -ru)
      lunch full_kumquat-userdebug && make otapackage -j8;
    ;;
    -p)
      lunch full_nypon-eng && make otapackage -j8;
    ;;
    -rp)
      lunch full_nypon-userdebug && make otapackage -j8;
    ;;
    -s)
      lunch full_pepper-eng && make otapackage -j8;
    ;;
    -rs)
      lunch full_pepper-userdebug && make otapackage -j8;
    ;;
    -g)
      lunch full_lotus-eng && make otapackage -j8;
    ;;
    -rg)
      lunch full_lotus-userdebug && make otapackage -j8;
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
  echo "ERROR: Number of options not correct. Usage: ./CompileROM.sh -u | -p | -s | -g | -ru | -rp | -rs | -rg"
  exit -1;
fi
