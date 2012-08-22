module Kimchi
  
  include ActiveSupport::Inflector
  
  class TestSuite
    
    @@test_suite = {}
    @@step_methods = []
    
    def self.ensure_feature(feature_name)
      unless @@test_suite.include? feature_name
        @@test_suite[feature_name] = CodeGenerator.new
        @@test_suite[feature_name].classname = feature_name.titleize.gsub(' ', '').camelize + 'Test'
      end
    end
    
    def self.add_step(step_name)
      @@step_methods << step_name
    end
    
    def self.add_scenario(feature_name, scenario_name)
      self.ensure_feature(feature_name)
      @@test_suite[feature_name].add_method({
        :name => 'test' + scenario_name.titleize.gsub(' ', '').camelize,
        :sequence => @@step_methods
      })
      @@step_methods = []
    end
    
    def self.write
      @@test_suite.each do |name,test|
        STDOUT.puts test.write
      end
    end
    
  end
end