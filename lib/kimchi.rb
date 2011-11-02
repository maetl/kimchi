require 'rubygems'
require 'active_support'
require 'active_support/inflector'

$: << File.expand_path(File.dirname(__FILE__))

require 'kimchi/code_generator'
require 'kimchi/feature_syntax'

module Kimchi
  VERSION = "0.0.0"
end