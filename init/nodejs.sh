#!/bin/bash -ex

# https://github.com/tj/n#third-party-installers

if [ -e "$N_PREFIX" ]; then
    echo "n is already installed in ${N_PREFIX}"
else
    echo "Installing n for node.js version management"
    curl -L https://git.io/n-install | bash
fi
