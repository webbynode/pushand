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

  config.before(:each) do
    PhD.hosts.clear
  end
  
  def isolate_config_files
    before do
      return if @isolated_config_files; @isolate_config_files = true
      PhD.rcfile = File.dirname(__FILE__) + '/.phdrc'
      PhD.rcdir  = File.dirname(__FILE__) + '/.phd'
    end
    after do
      return if @deisolated_config_files; @deisolate_config_files = true
      FileUtils.rm   PhD.rcfile if File.file?(PhD.rcfile)
      FileUtils.rm_r PhD.rcdir  if File.directory?(PhD.rcdir)
      PhD.rcfile = PhD::RCFILE
      PhD.rcdir  = PhD::RCDIR
    end
  end

  def phd command = ''
    `bin/phd --rcfile #{ PhD.rcfile } --rcdir #{ PhD.rcdir } #{ command }`
  end

end
