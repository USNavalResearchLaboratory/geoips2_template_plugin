# # # DISTRIBUTION STATEMENT A. Approved for public release: distribution unlimited.
# # # 
# # # Author:
# # # Naval Research Laboratory, Marine Meteorology Division
# # # 
# # # This program is free software: you can redistribute it and/or modify it under
# # # the terms of the NRLMMD License included with this program.  If you did not
# # # receive the license, see http://www.nrlmry.navy.mil/geoips for more
# # # information.
# # # 
# # # This program is distributed WITHOUT ANY WARRANTY; without even the implied
# # # warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# # # included license for more details.

#!/bin/bash

if [[ -z "$GEOIPS2_BASEDIR" ]]; then
    echo "Must define GEOIPS2_BASEDIR environment variable prior to setting up geoips2 packages"
    exit 1
fi

# This sets required environment variables for setup - without requiring sourcing a geoips config in advance
. $GEOIPS2_BASEDIR/geoips2_packages/geoips2/setup/repo_clone_update_install.sh setup

umask 0002
export GIT_SSL_NO_VERIFY=True
unset SSH_ASKPASS
module load git

# Do not include geoips2 or current package - expected they already exist since required for setup scripts
internal_plugins=""
internal_algs=""
external_repos=""
test_repos=""


if [[ "$1" == "repo_clone" ]]; then

    # Uses internal_plugins, internal_algs, external_repos, and test_repos variables
    . $GEOIPS2_PACKAGES_DIR/geoips2/setup/repo_clone_update_install.sh repo_clone

elif [[ "$1" == "repo_update" ]]; then

    # Uses internal_plugins, internal_algs, external_repos, and test_repos variables
    . $GEOIPS2_PACKAGES_DIR/geoips2/setup/repo_clone_update_install.sh repo_update $2

elif [[ "$1" == "install" ]]; then

    pip install -e $GEOIPS2_PACKAGES_DIR/template_plugin

    # Uses internal_plugins, internal_algs, and external_repos variables
    . $GEOIPS2_PACKAGES_DIR/geoips2/setup/repo_clone_update_install.sh install_plugins

else
    echo "UNRECOGNIZED COMMAND $1"
    exit 1
fi

