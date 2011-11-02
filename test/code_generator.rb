require 'test/unit'
require File.dirname(__FILE__) + '/../lib/kimchi'

class CodeGeneratorTest < Test::Unit::TestCase

  def setup
    @generator = Kimchi::CodeGenerator.new
  end
  
  def test_can_write_empty_class
    @generator.classname = "GeneratedEmpty"
    
    generated_class = <<GEN 
<?php

class GeneratedEmpty
{

}
GEN
    assert_equal generated_class, @generator.write
  end
  
  def test_can_write_given_sentence_to_classname
    @generator.classname = "Can update and delete Products"

    generated_class = <<GEN 
<?php

class CanUpdateAndDeleteProducts
{

}
GEN
    assert_equal generated_class, @generator.write    
  end

end