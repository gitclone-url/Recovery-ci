#!/bin/bash

# Source Vars
source $CONFIG

# Change to the Home Directory
cd ~

# A Function to Send Posts to Telegram
telegram_message() {
	curl -s -X POST "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
	-d chat_id="${TG_CHAT_ID}" \
	-d parse_mode="HTML" \
	-d text="$1"
}

# Clone the Sync Repo

# Initialize local repository
repo init --depth=1 --no-repo-verify -u https://github.com/Bootleggers-BrokenLab/manifest.git -b tirimbino -g default,-mips,-darwin,-notdefault
git clone https://github.com/Arafattex/local_manifest.git --depth 1 -b Lancelot_bootleg2 .repo/local_manifests
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Exit
exit 0
