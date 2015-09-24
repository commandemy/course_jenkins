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
package 'git'

# Install Ruby
include_recipe 'rvm::system_install'
rvm_ruby 'ruby-2.1.1'
rvm_default_ruby 'ruby-2.1.1'

group 'rvm' do
  members 'jenkins'
  append true
  notifies :execute, 'jenkins_command[safe-restart]'
end

# Add GitLab to /etc/hosts
template '/etc/hosts' do
  source 'hosts.erb'
  variables(gitlab_ip: node['course_jenkins']['gitlab_ip'])
end

# Restart Jenkins
jenkins_command 'safe-restart'
