#Compile

if [[ $# = 1 ]]; then
  . build/envsetup.sh
  if [[ $? = 0 ]]; then
    
    case $1 in
    -u)
      lunch full_kumquat-userdebug && make bootimage;
    ;;
    -p)
      lunch full_nypon-userdebug && make bootimage;
    ;;
    -s)
      lunch full_pepper-userdebug && make bootimage;
    ;;
    -g)
      lunch full_lotus-userdebug && make bootimage;
    ;;
    *)
      echo "ERROR: Unknow option";
      exit 1;
    ;;
    esac
  else 
    echo "ERROR: . build/envsetup.sh falied"
    exit 1;
  fi
else
  echo "ERROR: Number of options not correct. Usage: ./RecompileRamdisk.sh -u | -p | -s | -g"
  exit 1;
fi