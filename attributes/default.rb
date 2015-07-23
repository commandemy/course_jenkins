default['jenkins']['cookbooks'] = [
  {name: 'app', git: 'http://gitlab.course.com/root/course_app.git'},
  {name: 'jenkins', git: 'http://gitlab.course.com/root/course_jenkins.git'}
]

default['jenkins']['application_git'] = "http://gitlab.course.com/root/blog.git"