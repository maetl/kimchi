module Kimchi

  class CodeGenerator
    
    #include ActiveSupport::Inflector
    
    def initialize
      @nl = "\n"
      @ind = "\t"
      @classname = ""
      @parent_classname = nil
      @methods = []
    end
    
    
    def classname=(name)
      @classname = name.camelize_classname
    end
    
    def extends=(name)
      @parent_classname = name.pearified_classname
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
        "#{@nl}class #{@classname}#{parent_class_definition}#{@nl}{#{@nl}#{class_body}#{@nl}}"
      end
      
      def parent_class_definition
        if @parent_classname then " extends #{@parent_classname}"; end
      end
    
      def class_body
        body = @methods.collect do |method|
          "#{@nl}#{@ind}public function #{method[:name].camelize_methodname}()#{@nl}#{@ind}{#{@nl}#{method_body(method[:sequence])}#{@nl}#{@ind}}#{@nl}"
        end
        body.join(@nl)
      end
      
      def method_body(sequence)
        sequence || sequence = []
        body = sequence.collect do |method|
          "#{@ind}#{@ind}$this->#{method[:name].camelize_methodname}#{method_arguments(method[:args])};"
        end
        body.join(@nl) 
      end
      
      def method_arguments(args)
        if args
          arguments = args.map { |arg| if arg.is_a?(String) then "\"#{arg}\"" else arg.to_s end }
        else
          arguments = []
        end
        "(#{arguments.join(', ')})"
      end
    
  end

end
