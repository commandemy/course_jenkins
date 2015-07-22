#
# Cookbook Name:: course_jenkins_level_1
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

# Install Jenkins and dependencies
include_recipe 'jenkins::java'
include_recipe 'jenkins::master'
