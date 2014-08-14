#!/bin/bash

# Request git and brew
echo "Requesting git and brew... "

#if [ [ -x `which git`] && [ -x `which brew`] ]; then
if [ !  `uname` == Darwin -o `uname` == Linux ]; then
    echo "ERROR: This script requires git and brew to run"
    exit
fi



# ==============================================================================
# Show exit message
# ==============================================================================

echo ""
echo "All actions completed successfully. Exiting script now."

exit
