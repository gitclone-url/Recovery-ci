#!/bin/bash

# Source Configs
source $CONFIG

# Change to the Source Directry
cd ~



# Set-up ccache
if [ -z "$CCACHE_SIZE" ]; then
    ccache -M 10G
else
    ccache -M ${CCACHE_SIZE}
fi


# Prepare the Build Environment
source build/envsetup.sh


# export some Basic Vars
export ALLOW_MISSING_DEPENDENCIES=true
export CROSS_COMPILE_ARM32


# lunch the target
lunch twrp_${DEVICE}-eng
    
# Build the Code

mka -j$(nproc --all) $TARGET


# Exit
exit 0
