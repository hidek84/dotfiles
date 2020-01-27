#/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $SCRIPT_DIR
for file in $SCRIPT_DIR/init/*.sh
do
    if [ -f "$file" ]; then
        echo "========== Running $file =========="
        bash "$file"
        echo ""
    else
        continue
    fi
done