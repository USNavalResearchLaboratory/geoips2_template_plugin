 | # # # DISTRIBUTION STATEMENT A. Approved for public release: distribution unlimited.
 | # # # 
 | # # # Author:
 | # # # Naval Research Laboratory, Marine Meteorology Division
 | # # # 
 | # # # This program is free software: you can redistribute it and/or modify it under
 | # # # the terms of the NRLMMD License included with this program.  If you did not
 | # # # receive the license, see http://www.nrlmry.navy.mil/geoips for more
 | # # # information.
 | # # # 
 | # # # This program is distributed WITHOUT ANY WARRANTY; without even the implied
 | # # # warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 | # # # included license for more details.

GeoIPS 2.0 Overview
===================

Please see GeoIPS 2.0 Documentation Overview for high level information on the plugin infrastructure.


template_plugin Repository
==========================

This repository provides a working example of GeoIPS 2.0 plugin functionality.

It includes the following examples of Python plugins:

* filename_formats
    * test_fname: identical to "geoips_fname" in geoips2 repository, but renamed "test_fname"
* output_formats
    * imagery_test: identical to "imagery_clean" in geoips2 repository, but renamed "imagery_test"
* algorithms
    * single_channel_test: identical to "single_channel" in geoips2 repository, but renamed "single_channel_test"
* interpolation
    * interp_gauss_test: identical to "interp_gauss" in geoips2 repository, but renamed "interp_gauss_test"
* user_colormaps
    * Infrared_Test: identical to "Infrared" in geoips2 repository, but renamed "Infrared_Test"

It includes the following examples of YAML product parameter plugins:

* template_plugin/yaml_configs/product_inputs/abi.yaml
    * Infrared-Test product using variables B14BT
    * Functionality included in template_plugin abi.yaml product input is appended to functionality in all other repos
* template_plugin/yaml_configs/product_params/visir/Infrared-Test.yaml
    * Infrared-Test product parameters identical to Infrared product parameters in geoips2 repository
    * Infrared-Test product accessible via the "Infrared-Test" product name either command line
        or within a YAML output configuration file.


Creating your own plugin repository
===================================

This template_plugin can be used as a guide to create your own geoips2 plugin repository.  Follow instructions
in the README.md for modifying appropriately.

https://github.com/USNavalResearchLaboratory/template_plugin/blob/dev/README.md
