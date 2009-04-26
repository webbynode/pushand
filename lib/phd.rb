$:.unshift File.dirname(__FILE__)

%w( rubygems simplecli ).each {|lib| require lib }
%w( phd bin host ).each {|file| require "phd/#{ file }" }

# namespace aliases
PHD = PhD unless defined? PHD
Phd = PhD unless defined? Phd
