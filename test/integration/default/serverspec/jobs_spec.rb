require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Jobs' do

  jobs_file = '/var/lib/jenkins/jobs/job_builder/config.xml'

  describe file(jobs_file) do
    it { should be_file }
  end

  describe file(jobs_file) do
    its(:content) { should match /foodcritic-course-app/ }
    its(:content) { should match /foodcritic-course-jenkins/ }
    its(:content) { should match /foodcritic-course-database/ }
    its(:content) { should match /foodcritic-course-loadbalancer/ }
  end

  describe file(jobs_file) do
    its(:content) { should match /blog-app-test/ }
  end

  describe file(jobs_file) do
    #its(:content) { should match /-H 10.11.12.100/ }
    #its(:content) { should match /-H 10.11.12.101/ }
  end

end