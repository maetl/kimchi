require 'rubygems'
require 'gherkin'
require './lib/kimchi'

listener = Kimchi::FeatureSyntax.new
parser = Gherkin::Parser::Parser.new(listener)
parser.parse(File.new(File.dirname(__FILE__) + "/fixture.feature").read, 'fixture.feature', __LINE__-1)

