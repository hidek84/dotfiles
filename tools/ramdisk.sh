# http://qiita.com/snaka/items/c94384f22c7d0b79b035
# https://www.tekrevue.com/tip/how-to-create-a-4gbs-ram-disk-in-mac-os-x/

# Argument check
if [ -z "$1" ]
  then
    echo "Please input desired size for ramdisk (MB)"
    exit 1
fi

# Variables
desired_mb="$1"
disksize=`expr $desired_mb \* 2048`
DISK_NAME="RamDisk"

# Wait for /Volumes available
# https://apple.stackexchange.com/questions/58811/how-to-mount-a-ram-disk-on-startup
sleep 10

# Create RamDisk
if [ ! -e /Volumes/$DISK_NAME/ ]; then
  echo "Creating Ram Disk ($desired_mb MB)"
  diskutil erasevolume HFS+ "$DISK_NAME" `hdiutil attach -nomount ram://$disksize`
else
  echo "Ram Disk already exists"
fi

RAM_CACHE_DIR=/Volumes/${DISK_NAME}/caches
mkdir -p ${RAM_CACHE_DIR}/local_library/Caches
mkdir -p ${RAM_CACHE_DIR}/user_library/Caches
