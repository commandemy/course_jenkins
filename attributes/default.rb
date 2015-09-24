#
# Cookbook Name:: course_jenkins_level_2
# Attributes:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

default['course_jenkins']['gitlab_ip'] = '172.24.4.133'
default['course_jenkins']['chef_server_ip'] = '172.24.4.134'

default['jenkins']['cookbooks'] = [
  {name: 'app', git: 'http://gitlab.course.com/root/course_app.git'},
  {name: 'jenkins', git: 'http://gitlab.course.com/root/course_jenkins.git'}
]

default['jenkins']['application_git'] = "http://gitlab.course.com/root/blog.git"
