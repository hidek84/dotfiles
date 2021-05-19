KARABINER_CONF=$HOME/.config/karabiner/karabiner.json

echo "Processing for $KARABINER_CONF"
if [ -d "$(dirname $KARABINER_CONF)" ]; then
    if [ -e "$KARABINER_CONF" ]; then
      echo "> Taking a backup for $KARABINER_CONF with .bk"
      mv $KARABINER_CONF $KARABINER_CONF.bk
    fi
    echo "> Deploying config"
    cp  $HOME/.dotfiles/conf/karabiner.json $KARABINER_CONF
fi
