require 'test/unit'
require 'kimchi'

class CodeGeneratorTest < Test::Unit::TestCase

  def setup
    @generator = Kimchi::CodeGenerator.new
  end
  
  def expected_code(name)
    File.read(File.dirname(__FILE__) + "/code_generator/#{name}.php")
  end
  
  def test_can_write_empty_class
    @generator.classname = "empty class"
    
    assert_equal expected_code("empty_class"), @generator.write
  end
  
  def test_can_write_empty_method_to_class
    @generator.classname = "empty method class"
    @generator.add_method :name => "empty method function"
    
    assert_equal expected_code("empty_method"), @generator.write    
  end
  
  def test_can_write_basic_method_to_class
    @generator.classname = "basic method class"
    @generator.add_method(
      { :name => "basic method function", :sequence => ["call internal process"] }
    )

    assert_equal expected_code("basic_method"), @generator.write    
  end
  
  def test_can_write_basic_sequence_to_class
    @generator.classname = "basic method sequence"
    @generator.add_method(
      { :name => "basic method function", 
        :sequence => ["call internal process", "assert can do something", "assert can do another thing"] }
    )

    assert_equal expected_code("basic_sequence"), @generator.write    
  end

end