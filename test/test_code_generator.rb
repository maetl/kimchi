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
      { :name => "basic method function", :sequence => [:name => "call internal process"] }
    )

    assert_equal expected_code("basic_method"), @generator.write    
  end
  
  def test_can_write_basic_sequence_to_class
    @generator.classname = "basic method sequence"
    @generator.add_method(
      { :name => "basic method function", 
        :sequence => [{ :name => "call internal process" },
                      { :name => "assert can do something"},
                      { :name => "assert can do another thing"}] }
    )

    assert_equal expected_code("basic_sequence"), @generator.write    
  end
  
  def test_can_write_sequence_with_method_args_to_class
    @generator.classname = "sequence with arguments"
    @generator.add_method(
      { :name => "basic method function", 
        :sequence => [{ :name => "call internal process"},
                      { :name => "can check integer", :args => [200]},
                      { :name => "can check string", :args => ["hello"]},
                      { :name => "can check multiple args", :args => [404, "not found"]}] }
    )

    assert_equal expected_code("sequence_args"), @generator.write    
  end

end