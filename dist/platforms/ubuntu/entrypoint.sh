#!/usr/bin/env bash

#
# Create directory for license activation
#

ACTIVATE_LICENSE_PATH="$GITHUB_WORKSPACE/_activate-license"
mkdir -p "$ACTIVATE_LICENSE_PATH"

# test ssh
# mkdir git_test
# cd git_test
# git clone ssh://git@github.com/NexTech-AR-Solutions/HoloXAPI.git
# git clone ssh://git@github.com/NexTech-AR-Solutions/AREngine.git
# echo "repos cloned:"
# ls
# cd ../


#
# Run steps
#
source /steps/set_gitcredential.sh
source /steps/activate.sh
source /steps/build.sh
source /steps/return_license.sh

#
# Remove license activation directory
#

rm -r "$ACTIVATE_LICENSE_PATH"

#
# Instructions for debugging
#

if [[ $BUILD_EXIT_CODE -gt 0 ]]; then
echo ""
echo "###########################"
echo "#         Failure         #"
echo "###########################"
echo ""
echo "Please note that the exit code is not very descriptive."
echo "Most likely it will not help you solve the issue."
echo ""
echo "To find the reason for failure: please search for errors in the log above."
echo ""
fi;

#
# Exit with code from the build step.
#

exit $BUILD_EXIT_CODE
