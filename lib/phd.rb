$:.unshift File.dirname(__FILE__)

%w( rubygems simplecli ).each {|lib| require lib }
%w( phd bin ).each {|file| require "phd/#{ file }" }
