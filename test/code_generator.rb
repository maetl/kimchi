require 'test/unit'
require File.dirname(__FILE__) + '/../lib/kimchi'

class CodeGeneratorTest < Test::Unit::TestCase

  def setup
    @generator = Kimchi::CodeGenerator.new
  end
  
  def expected_code(name)
    File.read(File.dirname(__FILE__) + "/code_generator/#{name}.php")
  end
  
  def test_can_write_empty_class
    @generator.classname = "EmptyClass"
    
    assert_equal expected_code("empty_class"), @generator.write
  end
  
  def test_can_write_classname
    @generator.classname = "Can update and delete Products".gsub(' ', '_').camelize

    assert_equal expected_code("sentence_to_class"), @generator.write    
  end
  
  def test_can_write_single_method_to_class
    @generator.classname = "EmptyMethodClass"
    @generator.add_method "emptyMethodFunction"

    assert_equal expected_code("empty_method"), @generator.write    
  end

end