require File.dirname(__FILE__) + '/spec_helper'

describe PhD::Bin do

  it 'should have a command-line script' do
    `bin/phd`.should include('Usage')
    Capture { PhD::Bin.new.usage }.should include('Usage')
  end

end
