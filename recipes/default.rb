#
# Cookbook Name:: course_jenkins_level_1
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

# Install Jenkins and dependencies
include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

# Build job creation dependencies
include_recipe 'chef-sugar::default' # new
include_recipe 'jenkins-chef-dsl::plugins'  # new

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

# Install Ruby
include_recipe 'rvm::system_install'
rvm_ruby 'ruby-2.1.1'
rvm_default_ruby 'ruby-2.1.1'

directory '/usr/local/rvm/gems/ruby-2.1.1' do
  mode '0777'
  recursive true
end

package 'libgecode-dev'

## Create jobs
xml = File.join(Chef::Config[:file_cache_path], 'job_templates.xml')

## Find all relevant nodes
app_hosts_string = ''

search(:node, "role:#{node['course_roles']['app_server']}").each do |n|
  app_hosts_string << " -H #{n['ipaddress']}"
end

template xml do
  source 'job_templates.xml.erb'
  variables({
    cookbooks: node['jenkins']['cookbooks'],
    application_git: node['jenkins']['application_git'],
    hosts_string: app_hosts_string,
    ssh_agent: node['jenkins']['credentials']['key_name']
  })
end

jenkins_job 'job_builder' do
  config xml
end

# Install additional packages
package 'pssh'

# Add SSH Credentials
directory '/var/lib/jenkins/.ssh' do
  owner 'jenkins'
  action :create
end

cookbook_file '/var/lib/jenkins/.ssh/id_rsa' do
  source 'jenkins.pem'
end

jenkins_private_key_credentials node['jenkins']['credentials']['username'] do
  description node['jenkins']['credentials']['key_name']
  private_key lazy { File.read('/var/lib/jenkins/.ssh/id_rsa') }
end

# Restart Jenkins
jenkins_command 'safe-restart'
