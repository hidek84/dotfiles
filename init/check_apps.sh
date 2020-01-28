SCRIPT_DIR=$(cd $(dirname $0); pwd)

IFS=$'\n'
for app in $(cat $SCRIPT_DIR/apps_list.txt)
do
  APP_DIR="/Applications/$app"
  if [ ! -d "$APP_DIR" ]; then
    echo "- $APP_DIR may not be available"
  fi
done

echo "Finished Applications check"