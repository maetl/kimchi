module Kimchi

  class CodeGenerator
    
    def initialize
      
      @classname = ""
    end
    
    def classname=(name)
      @classname = name.gsub(' ', '_').camelize
    end
    
    def write
      start_tag + class_definition
    end
    
    private
      def start_tag
        "<?php\n"
      end
      
      def class_definition
        "\nclass " + @classname + "\n{\n\n}"
      end
    
  end

end

