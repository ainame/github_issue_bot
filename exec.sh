#!/bin/sh

export IRC_SERVER=""
export IRC_PORT=""
export IRC_CHANNEL=""
export IRC_USERNAME=""
export GITHUB_USER=""
export GITHUB_TOKEN=""
export GITHUB_REPO=""

./bot.rb > log/bot.log 2>&1 &
