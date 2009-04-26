require File.dirname(__FILE__) + '/spec_helper'

describe PhD do

  it 'should be namespaces under PhD (looks neat) as well as PHD (alias)' do
    PhD.should == PHD
  end

  it 'should be namespaces under PhD (looks neat) as well as Phd (alias)' do
    PhD.should == Phd
  end

end
