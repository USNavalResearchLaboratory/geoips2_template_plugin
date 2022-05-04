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

1. `geoips2_template_plugin/`: Change the `geoips2_template_plugin/` directory to the name of your package.
2. `setup.sh`: setup script to support non-pip-installable dependencies.
    * Update appropriately for your package requirments
    * If setup.sh not required, setup.py will be used for pip-based installation
3. `VERSION`: Set VERSION number for this package - if tied closely to geoips2, track geoips2 versions as appropriate
2. `setup.py` Update to reflect the new package name and any installation requirements or entry points.
                Entry points are linked to `geoips2_template_plugin/interface_modules` packages/modules
3. `geoips2_template_plugin/default_algorithm.py` Update to reflect the name of the algorithm and add the algorithm code.
        Create new files, directories, or anything else you need.
4. `__init__.py` Add any top level imports you might need in `__init__.py`
5. `tests/`
```
        * `pytest` Update unit tests for code validation
        * `test_geoips2_template_plugin.sh` Rename and update for your package
        * `test_all.sh` Update for full functionality tests for your package
        * `tests/scripts/data_types` Update for your current required data types
        * `tests/scripts/output_formats` Update for your current required output formats
        * `tests/outputs` Remove current "outputs" and update with your "correct" output.
                            run_procflow will create an "outputs" directory with scripts to update with current output.
                            These outputs are used for test comparisons, to ensure correct functionality.
```
6. `geoips2_template_plugin/interface_modules` Update for functionality you require in this plugin.
7. `geoips2_template_plugin/yaml_configs` Update for functionality you require in this plugin.
8. Update this README.md to include a description of your algorithm, and detailed installation instructions (see template below).

## Files that should be okay as-is

The following files should work correctly with no modifications

- `Dockerfile`
- `License`
- `.gitignore`
- `.gitlab-ci.yml`


# Template README.md

Modify the below steps for your particular package to create a standard README for your new plugin.

Probably start by doing a search and replace for "geoips2_template_plugin" -> "my_package_name"

Everything this line and above can be removed.
