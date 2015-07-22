#
# Cookbook Name:: course_jenkins_level_1
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

# Install Jenkins and dependencies
include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

# Install required plugins
node.set['jenkins']['executor']['timeout'] = 240

jenkins_plugin 'rvm'
jenkins_plugin 'htmlpublisher'
jenkins_plugin 'ws-cleanup'
jenkins_plugin 'ruby-runtime' do
  version '0.12'
end
jenkins_plugin 'envinject'
jenkins_plugin 'gitlab-plugin'

# Install Git
package "git"