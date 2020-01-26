# http://qiita.com/snaka/items/c94384f22c7d0b79b035
# https://www.tekrevue.com/tip/how-to-create-a-4gbs-ram-disk-in-mac-os-x/

# Variables
desired_mb="128"
disksize=`expr $desired_mb \* 2048`
DISK_NAME="RamDisk"

# Create RamDisk
if [ ! -e /Volumes/$DISK_NAME/ ]; then
  echo "creating Ram Disk"
  diskutil erasevolume HFS+ "$DISK_NAME" `hdiutil attach -nomount ram://$disksize`
else
  echo "Ram Disk already exists"
fi

# Create symbolic link for Safari
create_symlink () {
  SRC=$1
  DST=$2
  echo "Removing... $SRC and $DST"
  rm -rf "$SRC"
  rm -rf "$DST"
  echo "Creating symlink... $DST -> $SRC"
  mkdir -p "$DST"
  ln -nfs "$DST" "$SRC"
}

RAM_CACHE_DIR=/Volumes/${DISK_NAME}/Caches
LIB_CACHE_DIR=${HOME}/Library/Caches

# Create symlink for Safari/Vivaldi/Chrome
create_symlink ${LIB_CACHE_DIR}/com.apple.Safari ${RAM_CACHE_DIR}/Safari
create_symlink ${LIB_CACHE_DIR}/Google/Chrome/Default/Cache ${RAM_CACHE_DIR}/Chrome/Cache
create_symlink ${LIB_CACHE_DIR}/Google/Chrome/Default/Code\ Cache ${RAM_CACHE_DIR}/Chrome/Code\ Cache
create_symlink ${LIB_CACHE_DIR}/Google/Chrome/Default/Media\ Cache ${RAM_CACHE_DIR}/Chrome/Media\ Cache
