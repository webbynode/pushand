require File.dirname(__FILE__) + '/spec_helper'

describe PhD::Bin do

  isolate_config_files

  it 'should have a command-line script' do
    `bin/phd`.should include('Usage')
    phd.should include('Usage') # shortuct method
    Capture { PhD::Bin.new.usage }.should include('Usage')
  end

  it 'should be able to list hosts (also tests to see that hosts are *persisted*)' do
    phd('hosts').should_not include('foo')
    PhD.hosts << PhD::Host.new('foo')
    PhD.hosts.save
    phd('hosts').should include('foo')
  end

  it 'should be able to create hosts' do
    PhD.hosts.should be_empty
    phd('hosts:add foo').should include('Host added: foo')
    # phd('hosts_add foo')
    PhD.hosts.should_not be_empty
    PhD.hosts.names.should include('foo')
  end

end
