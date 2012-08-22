module Kimchi

  class CodeGenerator
    
    include ActiveSupport::Inflector
    
    def initialize
      @nl = "\n"
      @ind = "\t"
      @classname = ""
      @methods = []
    end
    
    
    def classname=(name)
      @classname = name.camelize
    end
    
    def add_method(method)
      @methods << method
    end
    
    def write
      start_tag + class_definition
    end
    
    private
      def start_tag
        "<?php#{@nl}"
      end
      
      def class_definition
        "#{@nl}class #{@classname}#{@nl}{#{@nl}#{class_body}#{@nl}}"
      end
    
      def class_body
        body = @methods.collect do |method|
          "#{@nl}#{@ind}public function #{method[:name].titleize.gsub(' ', '').camelize(:lower)}()#{@nl}#{@ind}{#{@nl}#{method_body(method[:sequence])}#{@nl}#{@ind}}#{@nl}"
        end
        body.join(@nl)
      end
      
      def method_body(sequence)
        sequence || sequence = []
        body = sequence.collect do |line|
          "#{@ind}#{@ind}$this->#{line}();"
        end
        body.join(@nl) 
      end
    
  end

end
