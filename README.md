#### # # DISTRIBUTION STATEMENT A. Approved for public release: distribution unlimited.
#### # # 
#### # # Author:
#### # # Naval Research Laboratory, Marine Meteorology Division
#### # # 
#### # # This program is free software: you can redistribute it and/or modify it under
#### # # the terms of the NRLMMD License included with this program.  If you did not
#### # # receive the license, see http://www.nrlmry.navy.mil/geoips for more
#### # # information.
#### # # 
#### # # This program is distributed WITHOUT ANY WARRANTY; without even the implied
#### # # warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#### # # included license for more details.

# GitLab Project Template for new Python-based GeoIPS Algorithms

This is a template that provides the base set of files for a new Python-based GeoIPS plugin.
Note that the files from the template are copied over verbatim,
and must be edited to work for any real algorithm.

## Usage

If you're on GitLab, just select this template when you're creating a new repository.
If you're on something other than GitLab, maybe this can be used natively, but if not,
just clone the repository without history, then push it to your Git server.
Something like this:

```
git clone <this repository> --depth 0
...
Create a repository on your git server
...
git remote add origin <repository URL>
git push -u origin master
```

Once that is done, you can start making changes.

1. `template_plugin/`: Change the `template_plugin/` directory to the name of your package.
2. `setup.sh`: setup script to support non-pip-installable dependencies.
    * Update appropriately for your package requirments
    * If setup.sh not required, setup.py will be used for pip-based installation
3. `VERSION`: Set VERSION number for this package - if tied closely to geoips2, track geoips2 versions as appropriate
2. `setup.py` Update to reflect the new package name and any installation requirements or entry points.
                Entry points are linked to `template_plugin/interface_modules` packages/modules
3. `template_plugin/default_algorithm.py` Update to reflect the name of the algorithm and add the algorithm code.
        Create new files, directories, or anything else you need.
4. `__init__.py` Add any top level imports you might need in `__init__.py`
5. `tests/`
```
        * `pytest` Update unit tests for code validation
        * `test_template_plugin.sh` Rename and update for your package
        * `test_all.sh` Update for full functionality tests for your package
        * `tests/scripts/data_types` Update for your current required data types
        * `tests/scripts/output_formats` Update for your current required output formats
        * `tests/outputs` Remove current "outputs" and update with your "correct" output.
                            run_procflow will create an "outputs" directory with scripts to update with current output.
                            These outputs are used for test comparisons, to ensure correct functionality.
```
6. `template_plugin/interface_modules` Update for functionality you require in this plugin.
7. `template_plugin/yaml_configs` Update for functionality you require in this plugin.
8. Update this README.md to include a description of your algorithm, and detailed installation instructions (see template below).

## Files that should be okay as-is

The following files should work correctly with no modifications

- `Dockerfile`
- `License`
- `.gitignore`
- `.gitlab-ci.yml`


# Template README.md

Modify the below steps for your particular package to create a standard README for your new plugin.

Probably start by doing a search and replace for "template_plugin" -> "my_package_name"

Everything this line and above can be removed.

Installation Guide
==================

This installation guide has installation steps specific to installing the template_plugin plugin, including
the base geoips2 conda install if not already installed.

Setup System Environment Variables
----------------------------------

```bash

    # Set up appropriate environment variables for all conda-based template_plugin setup steps
    # within this template_plugin README below

    # These steps will need to be copied and pasted into your shell any time you want to run the 
    # setup commands within this README.
    
    # Typical users do not have to make any modifications to the commands
    # within this README, and can copy and paste directly.

    # Once template_plugin has been installed, the "GEOIPS2_CONFIG_FILE" specified below will be
    # sourced when running template_plugin, and the direct environment variable assignments
    # within this section are no longer required.

    # If you would like to have the GEOIPS2_CONFIG_FILE automatically sourced so you do not have to manually run the 
    # source command for every new shell, you can add 
    # source </full/path/to/config/file>
    # to your ~/.bashrc file

    # GEOIPS2_BASEDIR will contain all source, output, and external dependencies
    # Ensure this is consistently set for all installation / setup steps below
    export GEOIPS2_BASEDIR=$HOME/geoproc

    # This config file must be sourced ANY TIME you want to run the geoips2 template_plugin plugin
    export GEOIPS2_CONFIG_FILE=$GEOIPS2_BASEDIR/geoips2_packages/template_plugin/setup/config_plugin

    # GEOIPS2_REPO_URL should point to the base URL for git clone commands
    export $GEOIPS2_REPO_URL=https://github.com/USNavalResearchLaboratory/

```

Clone template_plugin git repositories required for setup scripts
-----------------------------------------------------------
```bash
    mkdir -p $GEOIPS2_BASEDIR/geoips2_packages/

    git clone $GEOIPS2_REPO_URL/geoips2.git $GEOIPS2_BASEDIR/geoips2_packages/geoips2
    git -C $GEOIPS2_BASEDIR/geoips2_packages/geoips2 pull
    git -C $GEOIPS2_BASEDIR/geoips2_packages/geoips2 checkout -t origin/dev
    git -C $GEOIPS2_BASEDIR/geoips2_packages/geoips2 checkout dev
    git -C $GEOIPS2_BASEDIR/geoips2_packages/geoips2 pull

    git clone $GEOIPS2_REPO_URL/template_plugin.git ${GEOIPS2_BASEDIR}/geoips2_packages/template_plugin
    git -C ${GEOIPS2_BASEDIR}/geoips2_packages/template_plugin pull
    git -C ${GEOIPS2_BASEDIR}/geoips2_packages/template_plugin checkout -t origin/dev
    git -C ${GEOIPS2_BASEDIR}/geoips2_packages/template_plugin checkout dev
    git -C ${GEOIPS2_BASEDIR}/geoips2_packages/template_plugin pull
```

IF REQUIRED: Install and test base geoips2 conda environment
------------------------------------------------------------
```bash
    # SKIP IF YOU HAVE ALREADY INSTALLED BASE GEOIPS2 CONDA ENVIRONMENT 
    # This prompts you through all the steps of installing the geoips2 conda environment from scratch,
    # using the parameters specified above.  This only needs to be done once per system, skip if you
    # already ran this command and successfully installed the geoips2 conda environment.
    $GEOIPS2_BASEDIR/geoips2_packages/geoips2/base_install_and_test.sh dev
```

Install template_plugin package
-------------------------
```bash
    $GEOIPS2_BASEDIR/geoips2_packages/template_plugin/setup.sh repo_clone

    # Watch out for "GIT PULL FAILED" or "GIT CHECKOUT FAILED" log outputs -
    # those are legitimate failures and must be addressed before continuing
    $GEOIPS2_BASEDIR/geoips2_packages/template_plugin/setup.sh repo_update

    source $GEOIPS2_CONFIG_FILE
    pip install -e $GEOIPS2_BASEDIR/geoips2_packages/geoips2
    $GEOIPS2_BASEDIR/geoips2_packages/template_plugin/setup.sh install
```

Test template_plugin installation - these test scripts provide you with the full command line calls
---------------------------------------------------------------------------------------------
```bash
    source $GEOIPS2_CONFIG_FILE

    # This runs the single ABI test script
    $GEOIPS2_PACKAGES_DIR/template_plugin/tests/scripts/abi_aws.sh

    # This runs EVERY possible functionality test for this repo, and returns 0 if they all pass.
    $GEOIPS2_PACKAGES_DIR/template_plugin/tests/test_all.sh
```
