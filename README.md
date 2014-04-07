Description
===========

[![Build Status](https://secure.travis-ci.org/realityforge/chef-spydle.png?branch=master)](http://travis-ci.org/realityforge/chef-spydle)

A cookbook that installs [spydle](https://github.com/realityforge/spydle) to help monitor services and push data into the metric server.

Requirements
============

This cookbook depends on the java cookbook and has been tested under Ubuntu.

Attributes
==========

This cookbook uses the following attributes to configure how it is installed.

* `node['spydle']['conf_dir']` - Location for Spydle configuration
* `node['spydle']['lib_dir']` - Location for Spydle jars
* `node['spydle']['user']` - User Spydle runs as
* `node['spydle']['group']` - Group Spydle runs as
* `node['spydle']['package_url']` - The URL to download spydle from.
* `node['spydle']['package_checksum']` - The SHA256 checksum of spydle jars.

Usage
=====

..
