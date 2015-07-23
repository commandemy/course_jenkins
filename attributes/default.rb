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
