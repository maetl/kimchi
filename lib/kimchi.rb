require 'rubygems'
require 'active_support'
require 'active_support/inflector'

$: << File.expand_path(File.dirname(__FILE__))

require 'kimchi/code_generator'
require 'kimchi/feature_syntax'
require 'kimchi/test_suite'
require 'kimchi/live_test'

module Kimchi
  VERSION = "0.0.0"
end

# monkeypatch :(
class String
  # convert to a camelized class name
  def camelize_classname
    self.titleize.gsub(' ', '').camelize
  end
  # convert to a camelized method name
  def camelize_methodname
    self.titleize.gsub(' ', '').camelize(:lower)
  end
  # convert to PEAR style class name
  def pearified_classname
    self
  end
end