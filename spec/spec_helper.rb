require File.dirname(__FILE__) + '/../lib/phd'
require 'rubygems'

{ :capture => 'remi-capture', :spec => 'rspec' }.each do |gem, install|
  begin
    require gem.to_s
  rescue LoadError
    raise "Running the specs requires gem: #{ gem }.  To install, sudo gem install #{ install }."
  end
end

Spec::Runner.configure do |config|
  def isolate_config_files
    before do
      PhD.rcfile = File.dirname(__FILE__) + '/.phdrc'
      PhD.rcdir  = File.dirname(__FILE__) + '/.phd'
    end
    after do
      File.rm   PhD.rcfile if File.file?(PhD.rcfile)
      File.rm_r PhD.rcdir  if File.directory?(PhD.rcdir)
      PhD.rcfile = PhD::RCFILE
      PhD.rcdir  = PhD::RCDIR
    end
  end
end
