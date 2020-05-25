#/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

SCRIPTS=$(cat << EOF
startup_ramdisk.sh
homebrew.sh
nodejs.sh
python.sh
deploy_configs.sh
check_apps.sh
EOF
)

for script in $SCRIPTS
do
    file=$SCRIPT_DIR/init/$script
    if [ -f "$file" ]; then
        echo "========== Running $file =========="
        bash "$file"
        echo ""
    else
        continue
    fi
done

echo "Disabling hibernate"
sudo pmset -a hibernatemode 0
