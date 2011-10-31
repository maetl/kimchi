require 'rubygems'
require 'gherkin'

require 'gherkin/formatter/json_formatter'

require './lib/kimchi'

#listener = Kimchi.new
listener = Kimchi.new
parser = Gherkin::Parser::Parser.new(listener)
parser.parse(File.new(File.dirname(__FILE__) + "/fixture.feature").read, 'fixture.feature', __LINE__-1)

