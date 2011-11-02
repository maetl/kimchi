require 'test/unit'
require File.dirname(__FILE__) + '/../lib/kimchi'

class CodeGeneratorTest < Test::Unit::TestCase

  def setup
    @generator = Kimchi::CodeGenerator.new
  end

  def test_can_write_empty_file
    assert_equal "<?php\n", @generator.write
  end

end