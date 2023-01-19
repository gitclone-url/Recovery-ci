#!/bin/bash

# Source Configs
source $CONFIG

# A Function to Send Posts to Telegram
telegram_message() {
	curl -s -X POST "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
	-d chat_id="${TG_CHAT_ID}" \
	-d parse_mode="HTML" \
	-d text="$1"
}

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
