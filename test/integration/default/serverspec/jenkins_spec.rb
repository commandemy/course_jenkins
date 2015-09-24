require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Jenkins' do

  describe service("jenkins") do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(8080) do
    it { should be_listening }
  end

  describe file('/var/lib/jenkins/plugins/rvm.jpi') do
    it { should be_file }
  end

  describe file('/var/lib/jenkins/plugins/htmlpublisher.jpi') do
    it { should be_file }
  end

  describe file('/var/lib/jenkins/plugins/ws-cleanup.jpi') do
    it { should be_file }
  end

  describe file('/var/lib/jenkins/plugins/ruby-runtime.jpi') do
    it { should be_file }
  end

  describe file('/var/lib/jenkins/plugins/envinject.jpi') do
    it { should be_file }
  end

  describe file('/var/lib/jenkins/plugins/gitlab-plugin.jpi') do
    it { should be_file }
  end

  describe command('bash -l -c "which git"') do
    its(:stdout) { should match(/\/usr\/bin\/git/) }
  end

end