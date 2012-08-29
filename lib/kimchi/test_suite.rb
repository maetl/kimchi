module Kimchi  
  class TestSuite
    @@code_generator = CodeGenerator.new
    
    def self.classname=(name)
      @@code_generator.classname = name + "Test"
      @@code_generator.extends = "PHPUnit_Extensions_Functional_TestCase"
    end
    
    def self.add_scenario(name, steps)
      @@code_generator.add_method({
        :name => "test" + name,
        :sequence => steps
      })
    end
    
    def self.write
      @@code_generator.write
    end
    
  end
end