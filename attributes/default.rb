#
# Cookbook Name:: course_jenkins_level_2
# Attributes:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

default['course_jenkins']['gitlab_ip'] = '172.24.4.133'

default['jenkins']['cookbooks'] = [
  {name: 'app', git: 'http://gitlab.course.com/root/course_app.git'},
  {name: 'jenkins', git: 'http://gitlab.course.com/root/course_jenkins.git'},
  {name: 'database', git: 'http://gitlab.course.com/root/course_database.git'},
  {name: 'loadbalancer', git: 'http://gitlab.course.com/root/loadbalancer.git'}
]

default['jenkins']['application_git'] = 'http://gitlab.course.com/root/blog.git'

default['course_roles']['app_server'] = 'app_server'

default['jenkins']['credentials']['key_name'] = 'appserver-key'
default['jenkins']['credentials']['username'] = 'jenkins'
