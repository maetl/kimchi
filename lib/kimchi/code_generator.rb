module Kimchi

  class CodeGenerator
    
    def initialize
      @nl = "\n"
      @ind = "\t"
      @classname = ""
      @methods = []
    end
    
    def classname=(name)
      @classname = name
    end
    
    def add_method(name)
      @methods << name
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
        body = @methods.collect do |method_name|
          "#{@nl}#{@ind}public function #{method_name}()#{@nl}#{@ind}{#{@nl}#{@ind}#{@ind}#{@nl}#{@ind}}#{@nl}"
        end
        body.join(@nl)
      end
    
  end

end
