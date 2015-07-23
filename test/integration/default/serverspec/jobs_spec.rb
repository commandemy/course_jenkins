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
  end

  describe file(jobs_file) do
    its(:content) { should match /blog-app-test/ }
  end

end