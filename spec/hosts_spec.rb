require File.dirname(__FILE__) + '/spec_helper'

describe PhD, 'hosts' do

  isolate_config_files

  it 'should be able to track hosts' do
    PhD.hosts.should be_empty
    PhD.hosts << PhD::Host.new('remi.org')
    PhD.hosts.should_not be_empty
    PhD.hosts.first.name.should == 'remi.org'
  end

end
