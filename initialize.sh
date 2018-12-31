#/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $SCRIPT_DIR/init
for file in ./*.sh
do
    if [ -f "$file" ]; then
        echo "========== Running $file =========="
        bash "$file"
        echo ""
    else
        continue
    fi
done