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
  
  def test_can_write_empty_method_to_class
    @generator.classname = "EmptyMethodClass"
    @generator.add_method :name => "emptyMethodFunction"
    
    assert_equal expected_code("empty_method"), @generator.write    
  end
  
  def test_can_write_basic_method_to_class
    @generator.classname = "BasicMethodClass"
    @generator.add_method(
      { :name => "basicMethodFunction", :sequence => ["callInternalProcess"] }
    )

    assert_equal expected_code("basic_method"), @generator.write    
  end
  
  def test_can_write_basic_sequence_to_class
    @generator.classname = "BasicMethodSequence"
    @generator.add_method(
      { :name => "basicMethodFunction", 
        :sequence => ["callInternalProcess", "assertCanDoSomething", "assertCanDoAnotherThing"] }
    )

    assert_equal expected_code("basic_sequence"), @generator.write    
  end

end