class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}
        @#{attr_name}
      end
      def #{attr_name}=(attr_name)
        if @#{attr_name + "_history"} == nil
          @#{attr_name + "_history"} = [nil]
        else
          @#{attr_name + "_history"} << @#{attr_name}
        end
        @#{attr_name} = attr_name
      end
    }
  end
end
