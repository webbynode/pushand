require File.dirname(__FILE__) + '/spec_helper'

describe PhD, 'misc' do

  it 'should be able to add an #updated hook to objects' do
    object = []
    times_called = 0

    object << 'x'
    times_called.should == 0

    object.add_hook(:<<){|obj| times_called += 1 }

    object << 'x'
    times_called.should == 1

    object << 'x'
    times_called.should == 2

    # should not effect other arrays
    object = []
    object << 'x'
    times_called.should == 2 # should still be 2
  end

end
