$:.unshift File.dirname(__FILE__)

class PhD; end

%w( rubygems simplecli optparse-simple yaml fileutils ).each {|lib| require lib }
%w( host phd bin add_hook ).each {|file| require "phd/#{ file }" }

# namespace aliases
PHD = PhD unless defined? PHD
Phd = PhD unless defined? Phd
