require File.dirname(__FILE__) + '/spec_helper'

describe PhD, 'configuration' do

  it 'should be stored in ~/.phd/ and ~/.phdrc by default' do
    PhD.rcfile.should == File.expand_path('~/.phdrc')
    PhD.rcdir.should  == File.expand_path('~/.phd/')
  end

  it 'should be able to change these defaults' do
    PhD.rcfile = 'foo'
    PhD.rcdir  = 'bar'

    # returns the expanded paths
    PhD.rcfile.end_with?('/foo').should be_true
    PhD.rcdir.end_with?('/bar').should  be_true
  end

end
