#!/usr/bin/env bash
#
# This script prompts the user with a selection tool that takes a screenshot
# and saves it to a configured directory
#
# The name of the screenshot is given by the first argument to the script,
# but if no argument is given, the screenshot name will be its timestamp

set -euo pipefail

# The absolute path to the directory containing this script
my_dir=$(dirname $(readlink -f "${BASH_SOURCE}"))

source $my_dir/../user-config.sh
source $my_dir/error-handling.sh

usage="$0 <screenshot-name>"

if [ $# -eq 0 ]; then
    screenshot_name=$(date +%Y-%m-%d-%H%M%S).png
elif [ $# -eq 1 ]; then
    screenshot_name=$1.png
else
    invalid_args_error $0 "only one screenshot name permitted\n$usage"
fi

grim -g "$(slurp)" $SCREENSHOT_DIR/$screenshot_name \
    || die "Taking a screenshot failed\n"
